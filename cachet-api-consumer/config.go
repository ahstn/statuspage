package main

type CachetMonitor struct {
	API         CachetAPI                `json:"api"`
	RawMonitors []map[string]interface{} `json:"monitors" yaml:"monitors"`

	Monitors  []MonitorInterface `json:"-" yaml:"-"`
	Immediate bool               `json:"-" yaml:"-"`
}
