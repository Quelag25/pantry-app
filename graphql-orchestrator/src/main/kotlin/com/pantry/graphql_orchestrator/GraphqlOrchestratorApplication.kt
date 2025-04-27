package com.pantry.graphql_orchestrator

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class GraphqlOrchestratorApplication

fun main(args: Array<String>) {
	runApplication<GraphqlOrchestratorApplication>(*args)
}
