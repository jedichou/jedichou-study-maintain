<#
  OReilly-Windows PowerShell Cookbook, 3rd edition
  Author: Lee Holmes
  Chaper 1.7. Notify Yourself of Job Completion
  Problem:
    You want to notify yourself when a long-running
    job completes.
  Solution
    Use the Register-TemporaryEvent command.
#>

$job = Start-Job -Name TenSecondSleep { Start-Sleep 10 }
Register-TemporaryEvent $job StateChanged -Action {
    [Console]::Beep(100, 100)
    Write-Host "Job #$($sender.Id) ($($sender.Name)) complete."
}