IMAGE_NAME = tb1_g5_calculadora_irpf
CONTAINER_NAME = 2023_1_tb1_g5_calculadora_irpf

run:
	@echo "Running the container..."
	@if docker pull $(IMAGE_NAME); then \
		echo "Image pulled successfully."; \
	else \
		echo "Image not found. Building the image..."; \
		docker build -t $(IMAGE_NAME) .; \
	fi
	docker run -it --name $(CONTAINER_NAME) $(IMAGE_NAME)
