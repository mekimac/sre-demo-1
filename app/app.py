from flask import Flask, jsonify
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST
import random
import time

app = Flask(__name__)

# Prometheus counter example
request_counter = Counter("sre_demo_requests_total", "Total requests served")

@app.route("/")
def index():
    request_counter.inc()
    return "Hello from SRE Demo App!"

@app.route("/health")
def health():
    # Simulated dependency check (fails 5% of the time)
    dependency_ok = random.random() > 0.05

    status = {
        "status": "ok" if dependency_ok else "degraded",
        "timestamp": int(time.time())
    }

    return jsonify(status), (200 if dependency_ok else 500)

@app.route("/metrics")
def metrics():
    return generate_latest(), 200, {"Content-Type": CONTENT_TYPE_LATEST}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
