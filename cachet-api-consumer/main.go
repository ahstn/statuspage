package main

import (
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

	logrus.Debug("Configuration valid")
	logrus.Infof("API: %s", arguments["--url"])
	logrus.Infof("Config: %s", arguments["--config"])
}
