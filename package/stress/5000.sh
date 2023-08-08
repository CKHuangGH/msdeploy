for ((i=1; i<=5000; i++)); do
    deployment_name="nginx-$i"
    
    # 創建 Nginx 部署
    kubectl create deployment $deployment_name --image=nginx
    
    echo "Created deployment: $deployment_name"
done

echo "All deployments created."