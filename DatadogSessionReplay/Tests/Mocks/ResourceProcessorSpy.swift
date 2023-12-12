/*
 * Unless explicitly stated otherwise all files in this repository are licensed under the Apache License Version 2.0.
 * This product includes software developed at Datadog (https://www.datadoghq.com/).
 * Copyright 2019-Present Datadog, Inc.
 */

import Foundation
@testable import DatadogSessionReplay

/// Spies the interaction with `Processing`.
internal class ResourceProcessorSpy: ResourceProcessing {
    var processedResources: [([Resource], EnrichedResource.Context)] = []

    func process(resources: [Resource], context: EnrichedResource.Context) {
        processedResources.append((resources, context))
    }

}
