/*
 * Unless explicitly stated otherwise all files in this repository are licensed under the Apache License Version 2.0.
 * This product includes software developed at Datadog (https://www.datadoghq.com/).
 * Copyright 2019-2020 Datadog, Inc.
 */

import Foundation

/// Core utilities for monitoring performance and execution of the SDK.
///
/// These are meant to be shared by all instances of the SDK and `DatadogCore`.
/// `DD` bundles static dependencies that must be available and functional right away,
/// so it is possible to monitor any phase of the SDK execution, including its initialization sequence.
internal struct DD {
    /// The logger providing methods to print debug information and execution errors from Datadog SDK to user console.
    ///
    /// It is meant for debugging purposes when using the SDK, hence **it should log information useful and actionable
    /// to the SDK user**. Think of possible logs that we may want to receive from our users when asking them to enable
    /// SDK verbosity and send us their console log.
    static var logger: CoreLogger = ConsoleLogger(
        dateProvider: SystemDateProvider(),
        timeZone: .current,
        printFunction: consolePrint,
        verbosityLevel: { Datadog.verbosityLevel }
    )

    // TODO: RUMM-2239 Move `Telemetry` in here
}
