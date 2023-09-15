# Use a base image with AWS CLI installed
FROM node:14

WORKDIR /dist

# Install AWS CLI
RUN apt-get update && apt-get install -y awscli

# Define build arguments for TEST_USERS_PATH and GIFTCODES_PATH
ARG TEST_USERS_PATH
ARG GIFTCODES_PATH

# Set AWS environment variables
ENV AWS_ACCESS_KEY_ID='ASIAQN23WKWM6RNN4VVF'
ENV AWS_SECRET_ACCESS_KEY='6hdR64bulYzDf0Gub/6g7h53d+zUP75bbGJQ8RrW'
ENV AWS_DEFAULT_REGION='eu-central-1'
ENV AWS_SESSION_TOKEN='IQoJb3JpZ2luX2VjECgaDGV1LWNlbnRyYWwtMSJHMEUCIQCtd6BKnRuE/Iwd8TEB4LsaB/AHkcedrnSr4pO5zTG32wIgKtgQCOkf35E+yN16DSDFZyuvP/X0jCvMH51gln7XiakqkQMIERAEGgwwMjk3MjAyMDQ2OTciDLosKhptP6EsVJF/GiruAvBGML4671adl9CZ2a9Ly16L6N6Jj3J+++kpn8U2eoDr9xKcRRRG7LqHnja5vHqKCIQWHibYyNH2ucjfFkYgMsWxAbIKyppWw/WQANvwz65WhudssoGG4eLFbI30R9lUSHsJRzpA3tBA4qgWoXf3h70Jl7yvfz0TbYWTwinIMBEJkTopNuJESy3JqO6Q0shMKUj+9eV4HVh30HVtWEPWJBcNNk5ddE7tbI3kO82S501xqmQZ4fiQ98zs6BrOp4O/3CBjhMVU4xEX1tfqBmD0wkm0nuh1wxix0sHP791bFeO6424eh+agkYrzx02rxGH4UPDt8Y6WoHAr/P3FVxTPi249vTFAtjvpowvWWJx9fmHKrE+4EnFAWHOzf8cu2NRo3qMs6uSFJ9Z0qvuk6HeKDM4csKq5i+PX77qMu2bpMdPItYZr6DGd4yFp8Jv6T8LbTnaZZUh5uTLscdYNndfsCdyrzCyZy0KA/XLoIBNAODDqrYCoBjqmAZQNIhoXs1ohX/dNpr8l0LlYdIqeHKK+wa91OHUxsWrR3PsXKonxlRWLm5sOSyklx61q9+yOQ9kXhs5BAa0SN7aiPcxAPl2iYUZnXG+syA+UUu6I3bF+UJLuLTGFpSAx8VhNCVTEBGbZg1uNmjCs2rtqxHdHpubAVJvROAmGt2/DyNI03tWRfUbQuUEUXrFQlSdWIiKsl4u6k/FdImXu2FNDfcn/8f4='
ENV S3_BUCKET_NAME='load-testing-files-test'

# Use a shell script to conditionally copy files
RUN if [ -n "$TEST_USERS_PATH" ]; then \
        echo "==============================$TEST_USERS_PATH=========";\
        aws s3 cp s3://$S3_BUCKET_NAME/$TEST_USERS_PATH /dist; \
    fi; \
    if [ -n "$GIFTCODES_PATH" ]; then \ 
        echo "=======================================";\
        aws s3 cp s3://$S3_BUCKET_NAME/$GIFTCODES_PATH /dist; \
    fi


