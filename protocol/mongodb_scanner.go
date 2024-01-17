package protocol

import (
	"fmt"
	"gitlab.com/n3ph0s/onionscan/config"
	"gitlab.com/n3ph0s/onionscan/report"
	"gitlab.com/n3ph0s/onionscan/utils"
)

type MongoDBProtocolScanner struct {
}

func (rps *MongoDBProtocolScanner) ScanProtocol(hiddenService string, osc *config.OnionScanConfig, report *report.OnionScanReport) {
	// MongoDB
	osc.LogInfo(fmt.Sprintf("Checking %s MongoDB(27017)\n", hiddenService))
	conn, err := utils.GetNetworkConnection(hiddenService, 27017, osc.TorProxyAddress, osc.Timeout)
	if err != nil {
		osc.LogInfo("Failed to connect to service on port 27017\n")
		report.MongoDBDetected = false
	} else {
		osc.LogInfo("Detected possible MongoDB instance\n")
		// TODO: Actual Analysis
		report.MongoDBDetected = true
	}
	if conn != nil {
		conn.Close()
	}

}
