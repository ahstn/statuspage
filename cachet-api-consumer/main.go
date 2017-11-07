package main

import (
	"errors"
	"io/ioutil"

	"github.com/mitchellh/mapstructure"

	yaml "gopkg.in/yaml.v2"

	"github.com/Sirupsen/logrus"
	"github.com/docopt/docopt-go"
)

const usage = `cachet-api-consumer

Usage:
	cachet-api-consumer [-c CONFIG_PATH] [-u API_URL]

Options:
	-h --help			Show this screen
	-c --config		Path to config file (.yaml)
	-u --url			Cachet API URL

Examples:
	cachet-api-consumer -c ./config.yaml -u http://cachet:8000/api/v1`

func main() {
	arguments, _ := docopt.Parse(usage, nil, true, "cachet-api-consumer", false)

	cfg, err := getConfiguration(arguments["--config"].(string))
	if err != nil {
		logrus.Panicf("Unable to start (reading config): %v", err)
	}

	logrus.Debug("Configuration valid")
	logrus.Infof("API: %s", arguments["--url"])
	logrus.Infof("Config: %s", arguments["--config"])
	logrus.Infof("Monitors: %d\n", len(cfg.Monitors))

	for index, rawMonitor := range cfg.Monitors {
		logrus.Infof("Monitor: %d", index+1)
		logrus.Infof("Target: %s", rawMonitor.GetMonitor().Target)
		logrus.Infof("Field: %s\n", rawMonitor.GetMonitor().Field)
	}

}

func getConfiguration(path string) (*CachetMonitor, error) {
	var monitor CachetMonitor
	var data []byte

	data, err := ioutil.ReadFile(path)
	if err != nil {
		return nil, errors.New("File Not Found: '" + path + "'")
	}

	err = yaml.Unmarshal(data, &monitor)
	if err != nil {
		logrus.Warnf("Unable to parse configuration file")
	}

	monitor.Monitors = make([]MonitorInterface, len(monitor.RawMonitors))
	for index, rawMonitor := range monitor.RawMonitors {
		var t MonitorInterface
		var err error

		var s APIMonitor
		err = mapstructure.Decode(rawMonitor, &s)
		t = &s

		if err != nil {
			logrus.Error("Unable to parse configuration file", err)
		}

		monitor.Monitors[index] = t
	}

	return &monitor, err
}
