package main

import (
	"sync"
	"time"
)

const DefaultInterval = time.Second * 60
const DefaultTimeout = time.Second
const DefaultTimeFormat = "15:04:05 Jan 2 MST"
const HistorySize = 10

type MonitorInterface interface {
	ClockStart(*CachetMonitor, MonitorInterface, *sync.WaitGroup)
	ClockStop()
	tick(MonitorInterface)
	test() bool

	Validate() []string
	GetMonitor() *APIMonitor
	Describe() []string
}

type APIMonitor struct {
	Name   string
	Target string
	Strict bool

	Interval time.Duration
	Timeout  time.Duration
	Field    string

	MetricID    int `mapstructure:"metric_id"`
	ComponentID int `mapstructure:"component_id"`

	config *CachetMonitor

	stopC chan bool
}

func (mon *APIMonitor) Describe() []string {
	return []string{"Name: " + mon.Name, "API Field: " + mon.Field}
}

func (mon *APIMonitor) ClockStart(cfg *CachetMonitor, iface MonitorInterface, wg *sync.WaitGroup) {
	wg.Add(1)
	mon.config = cfg
	mon.stopC = make(chan bool)
	if cfg.Immediate {
		mon.tick(iface)
	}

	ticker := time.NewTicker(mon.Interval * time.Second)
	for {
		select {
		case <-ticker.C:
			mon.tick(iface)
		case <-mon.stopC:
			wg.Done()
			return
		}
	}
}

func (mon *APIMonitor) ClockStop() {
	select {
	case <-mon.stopC:
		return
	default:
		close(mon.stopC)
	}
}

func (mon *APIMonitor) test() bool { return false }

func (mon *APIMonitor) tick(iface MonitorInterface) {
	// Fetch API Field and POST to Cachet
}

func (mon *APIMonitor) Validate() []string {
	errs := []string{}

	if len(mon.Name) == 0 {
		errs = append(errs, "Name is required")
	}

	if len(mon.Target) == 0 {
		errs = append(errs, "Target is required")
	}

	if mon.Interval < 1 {
		mon.Interval = DefaultInterval
	}
	if mon.Timeout < 1 {
		mon.Timeout = DefaultTimeout
	}

	if mon.Timeout > mon.Interval {
		errs = append(errs, "Timeout greater than interval")
	}

	if mon.MetricID == 0 {
		errs = append(errs, "metric_id is unset")
	}

	if len(mon.Field) == 0 {
		errs = append(errs, "API Field is required")
	}

	return errs
}

func (mon *APIMonitor) GetMonitor() *APIMonitor {
	return mon
}
