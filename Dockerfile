FROM jsii/superchain

RUN yum install -y jq

RUN npm i -g aws-cdk

RUN mv $(which aws) /usr/bin/aws_V1

# install aws-cli v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install

# install aws-iam-auth
RUN curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator \
  && chmod +x ./aws-iam-authenticator && mv aws-iam-authenticator /usr/local/bin
  
# install kubectl
RUN curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/kubectl \
  && chmod +x kubectl && mv kubectl /usr/local/bin/
