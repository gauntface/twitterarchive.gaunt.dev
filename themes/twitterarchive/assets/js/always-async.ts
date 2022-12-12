import {init} from "@sentry/browser";
import { BrowserTracing } from "@sentry/tracing";

init({
	dsn: "https://748ea69ae17d48088e7047f414d9055b@o1296550.ingest.sentry.io/4504317324820480",
	integrations: [new BrowserTracing()],
	tracesSampleRate: 0.4,
});
