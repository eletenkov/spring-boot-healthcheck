all: 

package:
	./mvnw package

build:
	@docker build -t demo/demo .

run:
	@docker run --rm -ti demo/demo 

check:
	@curl --silent --fail --request GET http://localhost:8080/health jq -e '.status == "UP"' | echo "UP"