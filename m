Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139D92EB5B8
	for <dtrace@lists.linux.dev>; Thu,  5 Mar 2026 19:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740078; cv=fail; b=nHbVzXFw4cboOfr3+8xZBd2mR5p+7O0FKz+KxwfN6kySZWnWu5W8XHf6MUFsiFrevYZYPddAcOdF+WEWhZefkgREFnOFU0DgbsYW5krFFFjkSFqeGe5Yep68m95q4rTJde3MUrFl4BoqvKpKwl8PbQD8tZS3DsFHA95JdSpBZJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740078; c=relaxed/simple;
	bh=4KbN4Y/hBIbnfVrIoOsngTSfM6uovzVXv/lQkzRP+/4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oBxuSBqDdu/uUrzdTJ/ncdTt2zP+8MtQYDFMYdiXFeejHn6Rp2L64ubneRRZW5vR0iGLBMt2bAF8y2/tQeJCeNFRUY4FRzVWru9gcFvc9PcXCui068XyXvIR0qh/6T7o0DqhcaXmO52SXrMKTcubnS8XnhIHiSS8x7WVYitVOM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JNWP9eqC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FX+DrE7n; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JNWP9eqC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FX+DrE7n"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625JcQPJ1603469
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 19:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Z+9of1hWhJRccyd8GyNewXe9iBM6AkfKSAJ3wI+3P/4=; b=
	JNWP9eqCc6Ob/nFD+GmPGMOl1Vix4BCEizy679GKshwKhT2Wn4RWl9rcp9XJ63no
	ILEgnAXtZT463s6XL7tI7sR/U5wD97/e1A7qCPJOv2jTq5/ESK83DfE1YWEaP1KY
	mLKjmqdewdh3Qm/OiDONmxGmXVM0g538VXe5xssJRsRuS8VMfVnaYoRXQQyWBDZj
	yoQcugOAx7dv9NqnR78e5q1PUvmGCG6be0r5DKIxHQp2J6xnw0ZdUD5A92oh8N4m
	vB/N/eBQjbLnuBu0VrKqSdoGm+2fyKBvL4CP1MuUakve0y3cVV/INnjDHeDldIjM
	D1dV3Tqz55SmGlMSjEHGBw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cqg5t00ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 19:47:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 625J5JBB029878
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 19:47:54 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011050.outbound.protection.outlook.com [52.101.57.50])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptdp2nm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 19:47:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5qXpfnFomZqmqgEoZi2riV92lI1lSWpC6gsUCjGBmnG4lSi60B3fqwVOtwWM1zAYjVy6WEK+UXvtqvJSOFIMo0A7l+HXOyzQc4RrVrgCFalogq/gFYoQ4OcRfIRkcqG8y2mpm/0lDeOkEyUoa00SWWaeG7b6Aj3lWfakkVboR0F8p6SpcPo6yQ7E2HUcsMoWEx1tTmI8gHBeZeJr0mcKeeCtHgeBaXdW4Z/1cC9g8K6hRDighchZdrmeVJ80GJREriA8hz4ts1wPYsCxOBATqxCHAegFi2WtAMm07Ult1bn2RbweHKlvrLBg6HUeTWFrn5UW2aYDTH6IkeC5utRCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+9of1hWhJRccyd8GyNewXe9iBM6AkfKSAJ3wI+3P/4=;
 b=E9t+scZrNyETekrSBWVUydGR2Kx66LodABm6bXXHZjw2cyZAoZdM4KBsaqIYNlekYaXtTpvqozmFSdkpHjaRTtJuuz0EMAS58yvEELPBG2k8gnyvh3TgzmPgMYTCC5FuysKeXCZSGBtC7DiuTKH2mLbPDy7SrvKI24nm10sRr53J4Y+nSovzCY2e7hAiRQiJN6AYboAhPAiQUvvJg4Tb+gMtIhLXFP5IVKJ0YyXBUawT3K0gxhJOC8WDmho5tzF8VMVc0+Fvdymv1rKnTpbYSvQCbYDW2QozKXDxo/5AQ0RZZUj6MmcrTX07QWlZwqSht5XuJuZY9aKrIYhiqWNkzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+9of1hWhJRccyd8GyNewXe9iBM6AkfKSAJ3wI+3P/4=;
 b=FX+DrE7nh9ZEe7kZHDdZGgC4Y/ySWlDgmEhXbG4dEzl/rQeHIZJ4T7BWenyq3+QqO5NUR5iOOYSlNyvb+x0S4SPHXRMsa6CRGYZKHggInND/Hwlz8rSZ8WLZ9aVC6QEEBNh37tVbN8Sq7i2wh22AdZvS1WNpc5f+yj2Z1T62Ja4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB7401.namprd10.prod.outlook.com (2603:10b6:8:188::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:47:51 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 19:47:51 +0000
Message-ID: <e66491bb-7d6d-b1f3-995d-030b4913ba30@oracle.com>
Date: Thu, 5 Mar 2026 14:47:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2] license: add overlooked license
 statement in bpf/GNUmakefile
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522ED177548E81381CDE410C27DA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522ED177548E81381CDE410C27DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: IA4P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB7401:EE_
X-MS-Office365-Filtering-Correlation-Id: 471e3082-6c20-4c76-47f7-08de7af015e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	EyszhZtFGnv/CwIif70DzoZ5aLc+4+1Fs02KLNvQlkk+ZAHTr9mNnjgRZzJRV/meJsx2FjguAOljiXcztnzothFwMYxJCscDIb0YT8tC++ut9xF4j8+oxe5TjRswDFfcji7fACq8AkcEuqbQPlbNO29hAtmCVPO1Fl2f9HgMGhUqY8FIbXw1f6FFo1brEn9LkeP6Th3TmVL5kXEHbkL6brd0N0LNtNNB0h+VyKgG0FGJvQf6afjpYeDxxUEfDU7wQhtl1/72nf4G0BAzVrEb7Uitzqe+o/IFMdNP+dU6Cp+ferxGG6xTRpB3aCoTdytZR44c6j3WkQUZxe6KlmJ5YJOmyqhouxmzo6NzxnJrBz9vkq6t2K/s/f13TMl6HFN0G7QT3kfCVd1Q4+/elLs84RdPbiMeJY38nKnboD8c2pNoP+g/BJFMS7izjTAF25ryddbJeyyvEyrESPmsy3FeIshEVLA51fBGmLCjE/IAAAvyvXCbyFXqIwqnKb7QUUAmNwekhK1nlU3DsHsvxHCfzOEUqS+x4PySoFR7GYo40Vab1ezWVoDfwQnL/grS/mtAN2EnzryflFqQxn0iG0B749RUFQnZkeAdotaQvROtF0NLzmKL1v/kTjQ0u5W0Tln78LAEVw4oKzB01rib/vzdfnhTFM0DbEuM/aIruw1NmuDH9AWZ32yK5uk+0m1f5JfMzQI6Dpso7nGTTtnuoB1O+wZ+gTNngrh8GoIc4G461Hg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1R4OVR2SXQ3RENpQkJhUmJYb2xWOHJ2RzBUVEx4NnNPNnJzdThvUExEVGJ2?=
 =?utf-8?B?dzhmSG1xZjd3bEV6UHN6b2prMVRlelBkZnZLeEp4MkVTT3YrN0lXRUxIREpP?=
 =?utf-8?B?Q1huMGh1MFRBcVVDbmszRWQzd2s3cGREUlVqYVJBU0U2emNwL1lXVlFTTmg0?=
 =?utf-8?B?eDZqVHlxZkJJR3ZuZEtrNUd0MG1kZkFMVDhNWHByWHc1VVc4SUlwaUxvTVd0?=
 =?utf-8?B?TUp0U0JhamtqN3Y3TGp1YTdRenVmVEEwajM4b0RITEI3N1ZwTFcrb21hRmNT?=
 =?utf-8?B?NjRqdzRnWkxWVGk0NHlyaGV5NGhsUW9USm1BdE5MUHhmUVdZSHN6QmxFWHlo?=
 =?utf-8?B?ZkpROSsxUmR2TzVlNnZCbjd1TllLaVNVOEU3aUdTRU5ldTg4WDNIM09HS3p6?=
 =?utf-8?B?VWdrVHJYMHlkMHVKS2J3Y1E0VmNXakpKS3lRV0J2clJ4clJOa2dkNXpyNks3?=
 =?utf-8?B?aGdIditnOHJDMEJMQ1B4YmgzSG5oeWNvSDl6M2FwQ2ZMUHJ3Q2s4S2xFR0Iv?=
 =?utf-8?B?WEc3NFJsQ0FDNE1Fb29xL1QxdDcwdkIycGU1a0RYby9wNHFuWjdTaWxwNEg3?=
 =?utf-8?B?dUJ1SzF2cEx3TStjZnNJcldCeTBGVTlpekd6LzRFNWNreDFOR2FpeDZyYVVK?=
 =?utf-8?B?RHRsWnNDY1Fhdm5uWGpuNFVIN2Nya1IrWkZESGNjN2QzeWxSRzRpY3NsZEhC?=
 =?utf-8?B?akh3RXUzNU5TUTVCNzV2clhpM0lnWGRtYnlWS0tlWDBZRDNwZW4xK3U2V1p6?=
 =?utf-8?B?SndDUXBMZWNidGdHUEFGZzNDUEpHYnkyYzhZUzZybjZrT3J6VnR1VTlPU3dn?=
 =?utf-8?B?WitCUTJMM0FISFZTQWNqL3FPM3pYRi9VeTczclZhUytaQStWZm5BZjlhWFc0?=
 =?utf-8?B?QjIrSWJjV0ZDYVlrcmN3MWR2ZWJ1NnRZYi93YWNSWjBGUTZLeHBYYjJqRVU5?=
 =?utf-8?B?Ujg0Y2NUQk1Zcy9XTGxqMGR2NXJpZndrZ1FObmx2ZW5VZThCNzV4QnNzV0tj?=
 =?utf-8?B?aDZEVTVJRUpvVjNzL1dXMnFKci9zRHBuK3pubit4YjQ5U05vQkpLaE5hNjJq?=
 =?utf-8?B?NXJKVmR2R0pFcXdhN1B3M2RzUG5kSXJGYm5uRU9DK2dHdFlmK25xaHBVc2kx?=
 =?utf-8?B?eEtJemlqUVR4VmxZblNIanpndVhtczVYcFZmVFk1TW1Ra3RwTlo1d0NacnIz?=
 =?utf-8?B?VEZ0ckQ2Z0VoVGpCR0pscFNEQk9TL0tPRWJOZkdyVUREdEsrT2V0Zi9PajlY?=
 =?utf-8?B?RjlMTFBNLzZudzhFcXVZc0tva1VLeFNDSWdmTVMwNUxvdGNRU0ppdmVZR0Jt?=
 =?utf-8?B?K2hrK0hObDJiYnRoS010TXNKNEQ2SktGazBjVU9OZVdydHpLa2FUZXlZU1Ni?=
 =?utf-8?B?UTlLU1g2TWZmYXhXVksyeGloWGNYL2RiL1ptSnQrOXdoWTZ4U0grNit2bG80?=
 =?utf-8?B?aTBIaXRPS1lsRG81bXc4S20xSi9rY3I0L0h2R3pBVWYzNHBha1ZPSmM0azhQ?=
 =?utf-8?B?TmIwQk9GVExoczY3SmRYbTgrSmtWaXQzV29QNm1PSmx2d0VRZUJYbEVETXJR?=
 =?utf-8?B?d0krajBPcm5vSi8xR1dCSVhqRUo4Q2hOaU1VSWsyVloyM0xwbUE2VWsyWm84?=
 =?utf-8?B?V1A2RGFDeUd6SVM1cmZGVU82SFA1cGFmbFBzZ2RMY2pGbHZCN2pMRVdEcC9r?=
 =?utf-8?B?a0FPcWVTMmNNMWlqeDh5aGZFVGVWY1pFOXh0QnRsY0lzYU5WQ3kwTU5WeExO?=
 =?utf-8?B?eWtFZnVQWHhHVE5icUxLc0d3Ui94N3V0aW9QSjN6T2ZkR2taRUNGR3J5VlFx?=
 =?utf-8?B?U3pqYnhkZmRFaGd5UENwZmk4Z3dwY1M0azBSUTlpM3ltSDVlS0RoSHJ3L2ZS?=
 =?utf-8?B?ZUpaQVRKV2s1M0pOc3dLcWpVRXptUWVza2hjYTB0M0FVQUNFYWVnZUZBMk1u?=
 =?utf-8?B?QUU3NmVFYTdxMEhBR3dmSFBydlRIN2F4TWV5YWNVVnVoalFrbktyTUFFMFBR?=
 =?utf-8?B?Z0MxTHlkNU85WTc4T1BSL2M1WVZKaHlIMWU1YnRvQ1doWXhkMDFwQUo3a0g2?=
 =?utf-8?B?amNpK3UrWld3UWZra01mbVlJMmlJbi8zZzFoSERUOVo5UnVVZDQrZDRCd3kz?=
 =?utf-8?B?S1RKbUQybmQzSXp3d1RWR0pHc1ZNbXdOajZIcjZ6eDRnb2d3MFBiQ3JqbEhS?=
 =?utf-8?B?MU1XUHg5RklvTXN4alg3cXZvU2Q0Vm5MRGRoY1ZHNmtKZHFGdVFsdy9NTWJv?=
 =?utf-8?B?aFpkdHUxVGVSQmJLWWRhVGMza2VIcVBtVThUQnM5YjdsQllrb0lYVjV5RHZ4?=
 =?utf-8?B?MlNzUFFXemVlNkV5MXhGM21hMVMrNlZWVXpFanJxUkFaOUxMaFduZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QlhuzBVAC/l0OHp1qk3LD4+gIWyaKbyxMtE3fKU84n30WtKkYP78CszAS1+iwIpRRFc/cVB0H8mj96ifA7FQvp6z0Yiebv9KjzGv4pKSCG77XV8m9bpry30a96LDMYrnniQVbR3bU2dQT74H987yHE1QEBkMAATgKSuSlNNzyA/0giFQAcFi8WN+Cb8X8FFP2GLxMjEzExeA2+EQ1jVmykr95h3uXxuzwEMxj66vyMPsm6CaJcXlpb24chi3cc07TZC+Yw/E6XYCujc8fmnAQAGcQ4bz8AtW+4s52KCXE30nTy+pH8x+KqrNgH5XB55Akpb2hlgrgwzYxG0Q70WqyfrP1l6KH++rf2M6paE2P7V6h/GKQSWhDz5tQ+WYeofhku2kUUE6QvWYDwsrexfyqMhsfn3ZVyX1Jpyb/I66hxm2d6y+CYpCHAEBY27cBgQNx+SDjiuOpfafhpELAHhSmcFPRAXXEa+X9/4HSXRe9NK5S4U6xdL9LlA+yV7yGld0iWYC0ZWaHdQibMCgP4OkKJiNghLF8r2PIy+tgjc+CPwijl+ZwFdwa4z9/XNzJS/pJCIFdSZ5QEO1+MNfxzXlXI4RO/fiyATNKXyy7jRDFwQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471e3082-6c20-4c76-47f7-08de7af015e3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:47:51.2927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9PBpSEDh+DnyHZ+N1lBMwZXvtZSH7ZGQNyAShZULo0r3M1xahfMrWFwSX/K4Ig5ak56zwgLsJ5wdmOMzpuquA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7401
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2602130000 definitions=main-2603050164
X-Proofpoint-GUID: tUbrxcT7irmoh1nslt5pUDrCa6DKE2B3
X-Authority-Analysis: v=2.4 cv=YLWSCBGx c=1 sm=1 tr=0 ts=69a9ddeb b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8
 a=o-RUtwAiAMg1WUuiRWEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: tUbrxcT7irmoh1nslt5pUDrCa6DKE2B3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE2NSBTYWx0ZWRfX7CYngRTBof5f
 ZytiKRhCSgNGC/+Bju+ZYdPaaD9dJRz7n9kHa9769v/XouhG74PIcKONcO56j7AaF9uZ6BjAI5r
 43en3jTbwfRHPcERdFsbyj5RJZOWqQJ49Z//S3AmSCjc9CGJpLav3eODKN2rtLOSyFezaf24Vg1
 1ztV4IItO7lBD3G92ARV6ZSGlcyuqlgpx+WIhEiSuMBkcRZKny8wXVxBvh8ocaXX9x18AunahR4
 7fWefA5NNWTqC/Ww6skLGE8CoyRZ/mnB9RGh5G0Spto98lygXVj2sI6YpOXF7dJ217JuqaHFT0U
 ijtZG2gT+OTTxCl3xOqd4JcliAc+fti4dcA3XQpdATPUVYZc5+tjNJoHI8/QRfIFne/4H2IQxZ3
 UlKVKdgr1zx0nObJdcbzkveXaIRzjk41/97/HtawBptaQqH5SfbZSuK72N1/B/PEzoT+BWMrX5Y
 our4feZSBZuQ9Y1Nu8g==

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 3/5/26 14:33, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   bpf/GNUmakefile | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/bpf/GNUmakefile b/bpf/GNUmakefile
> index 4a27e08b8..51ed7df6e 100644
> --- a/bpf/GNUmakefile
> +++ b/bpf/GNUmakefile
> @@ -1,3 +1,8 @@
> +# Oracle Linux DTrace.
> +# Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
>   %:
>   	$(MAKE) -C .. $@
>   
