package protocol

import (
	"gitlab.com/n3ph0s/onionscan/config"
	"gitlab.com/n3ph0s/onionscan/report"
)

type Scanner interface {
	ScanProtocol(hiddenService string, onionscanConfig *config.OnionScanConfig, report *report.OnionScanReport)
}
