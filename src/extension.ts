import * as vscode from 'vscode';
import * as path from 'path';

export function activate(context: vscode.ExtensionContext) {
	console.log('Extension "coverage-report-for-linux" is now active!');

	const disposable = vscode.commands.registerCommand('coverage-report-for-linux.generatecoveragereport', () => {
		vscode.window.showInformationMessage('Generating Coverage Report Using Bash');

		const scriptPath = path.join(context.extensionPath, 'run_coverage.sh');

		const terminal = vscode.window.createTerminal({
			name: 'Coverage Report',
			shellPath: '/bin/bash',
			shellArgs: ['-c', `"${scriptPath}"`]
		});
		terminal.show();
	});

	const test = vscode.commands.registerCommand('coverage-report-for-linux.openwindowcoveragereport', () => {
		vscode.window.createWebviewPanel("viewType", "title", {
			preserveFocus: true,
			viewColumn: 1
		});
	});

	context.subscriptions.push(disposable);
}

export function deactivate() { }
// 5Qxn17OvUGPbPzJoHOnHe8IklGvvqDhDwQnTV4SGeFqDv18SGV4GJQQJ99BFACAAAAAAAAAAAAASAZDO26dS