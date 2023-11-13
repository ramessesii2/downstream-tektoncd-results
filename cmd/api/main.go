/*
Copyright 2020 The Tekton Authors

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package main

import (
	"context"

	"github.com/tektoncd/results/pkg/api/adapter"
	"github.com/tektoncd/results/pkg/api/server/config"
	_ "go.uber.org/automaxprocs"
	kubeclientset "k8s.io/client-go/kubernetes"
	evadapter "knative.dev/eventing/pkg/adapter/v2"
	"knative.dev/pkg/client/injection/kube/client"
	"knative.dev/pkg/injection"
	"knative.dev/pkg/logging"
	"knative.dev/pkg/signals"
	"knative.dev/pkg/system"
)

const (
	tektonresultsapikey = "tektonresultsapi"
)

func main() {
	serverConfig := config.Get()
	// serverConfig := &config.Config{}
	ctx := signals.NewContext()
	cfg := injection.ParseAndGetRESTConfigOrDie()

	ctx = injection.WithConfig(ctx, cfg)

	loggerConfiguratorOpt := evadapter.WithLoggerConfiguratorConfigMapName(logging.ConfigMapName())
	loggerConfigurator := evadapter.NewLoggerConfiguratorFromConfigMap(tektonresultsapikey, loggerConfiguratorOpt)
	copt := evadapter.WithLoggerConfigurator(loggerConfigurator)
	// put logger configurator to ctx
	ctx = evadapter.WithConfiguratorOptions(ctx, []evadapter.ConfiguratorOption{copt})

	kubeClientset := kubeclientset.NewForConfigOrDie(cfg)
	ctx = context.WithValue(ctx, client.Key{}, kubeClientset)

	ctx = evadapter.WithNamespace(ctx, system.Namespace())
	ctx = evadapter.WithConfigWatcherEnabled(ctx)

	evadapter.MainWithContext(ctx, tektonresultsapikey, adapter.NewEnvConfig, adapter.New(serverConfig))
}
