/*
 * Unless explicitly stated otherwise all files in this repository are licensed under the Apache License Version 2.0.
 * This product includes software developed at Datadog (https://www.datadoghq.com/).
 * Copyright 2019-2020 Datadog, Inc.
 */

import Foundation

/// `LogOutput` writing logs to file.
internal struct LogFileOutput: LogOutput {
    let fileWriter: Writer

    func write(log: LogEvent) {
        fileWriter.write(value: log)
    }
}

extension LoggingWithRUMErrorsIntegration: LogOutput {
    /// Writes `critical` and `error` logs to RUM.
    func write(log: LogEvent) {
        if log.status == .error || log.status == .critical {
            addError(for: log)
        }
    }
}
