namespace K8sDemoApp.Models;

public static class K8sSeedHelper
{
    public static List<K8s> GetK8s()
    {
        return new List<K8s>
        {
            new K8s { Id = 1, Name = "K8s 1" },
            new K8s { Id = 2, Name = "K8s 2" },
        };
    }
}