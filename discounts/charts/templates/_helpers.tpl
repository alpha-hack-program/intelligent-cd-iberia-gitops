{{ define "discounts.name" }}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{ define "discounts.fullname" }}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- .Release.Name }}-{{ .Chart.Name }}
{{- end }}
{{- end }}

{{ define "discounts.selectorLabels" }}
app.kubernetes.io/name: {{ include "discounts.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{ define "discounts.labels" }}
{{ include "discounts.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}