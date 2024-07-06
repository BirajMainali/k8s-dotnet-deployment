using System.ComponentModel.DataAnnotations;

namespace K8sDemoApp.Models;

public class K8s
{
    [Key] public long Id { get; set; }
    public string Name { get; set; }
}