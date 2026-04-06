{{-
define "discounts.name"
-}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{-
define "discounts.fullname"
-}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Chart.Name }}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Chart.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{-
define "discounts.chart"
-}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{-
define "discounts.labels"
-}}
app.kubernetes.io/name: {{ include "discounts.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{-
define "discounts.selectorLabels"
-}}
app.kubernetes.io/name: {{ include "discounts.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}