Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348598C07
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 04:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728705906; cv=fail; b=saOHj+tpiYCuxalvp/XsqytkTIQYV1Gp13+hAgdfdcsxcmQOcwU6cVOqkJcf8gY2uo+FUZhhRvTcNtvmeIvXVFBxWV2mkZRE/RHddppIauv+Xcw9dlbHeqTMATPtAfLiZ3zls+uDHCg0Oji8/GoPRhNq8oXPdicO6W9ds59SZSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728705906; c=relaxed/simple;
	bh=LYgOamdaqHHMfyjJo+o7VcxAQzmhhY2Y+sGnD2TCmNE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O7LJItsNeA8xqj0JIH8Pzaw6w2QUG2HeYAUMasET+ClhftuUz5XzQlfEeeIDFO8iOcSExl4lyloUcheIFKo7LyfjpSi38j6jgIiAkIGVZD94zQz3QcS2O3Dzz9fA6PduqsDZvUjly9fNLHUAH74rSmI7tHEI2G9rmAz58gEFBqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g8kj9awT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tjxSjJW1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g8kj9awT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tjxSjJW1"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C26gEL016322
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 04:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=kPsIBQL6PVp/KEDJjlh/cIKpVAeJg6kUKxVXO0RMk7s=; b=
	g8kj9awTPFpkJbwzQ+jdi/GNivNSw4lp/gO6VuEZSS5SsVOLsoaqa4+EpHQSy6rl
	Hu03t6ePmVyYIB1dnUp6yhYNntK/hvU7rEhDhwORy/SPqYZonR33I03i1JytmOW+
	w8LcaN40RrQKlU5WMeqUOlmkpunjKOfmI1M5qQeZXtXyqpMefj/QT8zJhkGZc/cV
	GlVFalXVrch5Il3nI/mCgzH+mjF7CI5MNWf2Qm0X7/4x7wPBG8OPSAzDb0owWw43
	+4mmmgTK78bpLIP+CcoACTxEUiWfRtk2Xxpt+cT5C2Fy8Ha0wxlEk6RdKnunAx4Q
	/Xi5WYQZAsmLcyofp5pzoA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427g1a81sx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 04:05:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49C1XBIG019898
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 04:05:03 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 427fj4a3jj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 04:05:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXw831PNhVSWgdw6ZYChpJsyGa1EG9rGmkmHOwnxIU1J5q/F3UecQHmwaqMIXKZmD7oD2VhCoPO45JS635WDXSlbVzIGNqgdviANasEbo+AAH8xMkqhVucRnLdqk6l6Wmx4xssdFIO9g2wuknkXSBw8JKBuUgdjbiYoi/6hVxgGWowx/HWj0AFVUrlAGueuIiGYIDsPxKIjx9bZo8GH1H7zLAiU+VwETmn+b3NUf1GFmM7yIK/e6RPpooxuGgxkK97hOGlB3tJ5uRiNCn9fyeglZ3j0LsERPMySYaw9rW25txi0H+/KLHkQBWR/Ylg4ov+vWT5A1iirKpMDndcC0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPsIBQL6PVp/KEDJjlh/cIKpVAeJg6kUKxVXO0RMk7s=;
 b=gHhWE21mV+M3j4XQCSO/0flcHPN7LQL/Di2rP4d+7NwCDJ5Ntr4EJcL+C3NCLXKWheQUhuvKMGUyH+NGJb5jV4NUTRP6fdJaH2wN8x9+i9I+w6hKJfuvE4kA/bPAb3x6HEjeQ52WuvDh0aur60IF094AroIW/y8XAHlivTyRMPOmXCTTREPqcBHHUrakgPGh5YJpsSXoaNedIPwrUO7TnQUrrqoM2bCpGlFEP2+rkCtJ/w0Wmx+hmgb+oWlPYDyoEKss+23cMD3wFQZXQf0SxtYEVX6DBDnKPi2owhtzIwvsK6cDUWgah3RPx34CFq6zHqAwMs76zZNh+hmNAjYsiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPsIBQL6PVp/KEDJjlh/cIKpVAeJg6kUKxVXO0RMk7s=;
 b=tjxSjJW10HFzJ0+VAGhD5C3Z6uduMIeFm9nmsVo6VmvcXu2Td/XkUwol8ItjsFhMFBK25U0wQwzdLabFZYkRmv3FeFzfrbCEa3I1SLapjQcc9Lo5GSchRujMLuRXHal4d4F7+FmEhnJyKprrYpAP7KDNlScV6qqg0apWGGS9Ses=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW4PR10MB6584.namprd10.prod.outlook.com (2603:10b6:303:226::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Sat, 12 Oct
 2024 04:05:00 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8048.018; Sat, 12 Oct 2024
 04:05:00 +0000
Message-ID: <890f24d7-aaa6-c957-97f4-e15954eed54e@oracle.com>
Date: Sat, 12 Oct 2024 00:04:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v5 07/19] Create the BPF usdt_names and
 usdt_prids maps
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241009054535.28199-1-eugene.loh@oracle.com>
 <ZwdeK90de5dmBFT4@oracle.com>
 <44ae36fb-9065-d761-5571-d1d2657e5ce0@oracle.com>
 <Zwm6lBLQGeFQS2Mu@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zwm6lBLQGeFQS2Mu@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW4PR10MB6584:EE_
X-MS-Office365-Filtering-Correlation-Id: 09eeb802-ff77-4e7c-3799-08dcea730afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VG9BKzhLY0R5QmNIZDM4WFZmUWtKdW5nS3pQQlJWdDFpbTF6Vi85djVORVBn?=
 =?utf-8?B?R3R2K2Z2V0MyakVOK1RuOGdtenFyN1gxMitnRUorVVRXY2czdHcvdlRrejhF?=
 =?utf-8?B?d1kzMjJaVmgra01kRHJIQndiWlZsckQ5bm81VXBQb1h0aHp0UGt1a2hOdXVK?=
 =?utf-8?B?T2tCWlhZcU56aVBwakdZNmY0SzlHOS92OUdITmNKQWpreTB5aklOOWZRSjBh?=
 =?utf-8?B?bitPOTNjb2VTU2o1cWIvMzhiWmZ5aEhyL0JVY0hCWVNKdnRtdDN1MlVGcWs3?=
 =?utf-8?B?a0JxdWNwT1ZEZ0NTdUx1YlRZZmZtaUFHQmRLaUdiVWhobHg3bm8yaGFpL01O?=
 =?utf-8?B?ZHhYbXRydm9NbTdLVUhrNC9HR3BUaUxMdmg2dEhsUm4zaGNmdUN5VlNsRkNn?=
 =?utf-8?B?VkZCSnc2OTA2ZlZMN2pCcXlOZmcrT0lNUVJZLzBTSDFIZFlSS0dnMWpnRW91?=
 =?utf-8?B?ZXhQaDRiQ2dwVVIvNkh0L3BpeTlQM2JNWFNsMVMxWkNjTXh4UWVENUFIMG8v?=
 =?utf-8?B?eWRuL281UkhMQkNFN3JOR2Y5U3pCS1JLa045aXBzd2oxNDJRT0laenRnOEZH?=
 =?utf-8?B?aENpMDM0ZExYVE03Vlptd2xQZVg2Q0hURVptejd0MFlZQTdzOXNoQlR3YmFY?=
 =?utf-8?B?ZDBQQ3lqbm9sTHFCQTNBdWVhZGs0bUpWYzVsaEZXQkp4UmViSXlXTkFxMFlY?=
 =?utf-8?B?S294ZnJDMjJqWG1WK0d5MWI4dDVjRUN5WlU2QnlZcEZMTG95eXZzSUI5U0V0?=
 =?utf-8?B?TGl3UDFvZGVlOW9MN1lLbjV2WldidmJkdWo1RUIxN3RhTFExcnZzNGprZERo?=
 =?utf-8?B?M0taekdBbzFad0NTWU1iMDVicW1kc3lKd3RZS3dqbFc2NEtPT0dkazl3bmcw?=
 =?utf-8?B?TDA0ai9Ubi95R0dzL09yQklmS1JVdXg3YUZtbkkzOXFBZ2JRRXFJbXpCM3hN?=
 =?utf-8?B?YUR4eUFBWS9vUzZRWkRmMDc1ZHhEYk5Hbi9wckt3amlvQnZkdHZYU0FaNThx?=
 =?utf-8?B?b0xrSkY3WndSRWtIQVlqUWhpWExrQWhMbVhRUWVNeU1JWnRHZmZFd3p4a21p?=
 =?utf-8?B?OE5oS25Tb1VDckU1K1o4ajcxOEVhWnYxS1E5Q05pT2c4TmM0dkF3eHdoazAy?=
 =?utf-8?B?Y2tmTndKZWVOVkFmeDY5d0YzbFJaWWtGci9GR094Y29USGlJM1dHUzJNR0Y1?=
 =?utf-8?B?Z3NHVC9UQjJwK0J0NFFsS2QzcVptQkRvZlhEaVhuUVZDWUpuZmhsS2dPdUxX?=
 =?utf-8?B?VmhuSnh4b1FkcE9CeHE1VjhFeTY5aSs5emdJaUlwWHBiWkN3aVBkWDdxQ2ZM?=
 =?utf-8?B?bC9XS2dqaTExM1Z2TW0yTzRoS1FkSmlvSUtmbElSZG5TdjZwZzV4Y3hXK2h1?=
 =?utf-8?B?dEdzUFNiRXk4ZnBVU3hkRmtvbXpUTTZDNG8rUHJuQlZoVE5GOExhTUFlakNj?=
 =?utf-8?B?NEF5RWZVV3RGNEVZclg3REorQjdoRG9iL3VYSERnNWU4elg0cWM0SHluN3NV?=
 =?utf-8?B?SkdyOUU1b21zYVl2ajd2MVV4ekpHekJZRzE0WHRNQWlidFA4bnpRcmNZSGdk?=
 =?utf-8?B?dTB5OUxnd0U2cVBYS2laMmNmTHVhZEFTMG1NUE5ZYU5Qakp0amQ0bFZKdE00?=
 =?utf-8?B?RTZGSjdCMkRTTmpvY1pqVlZBSDFWSk5XRGMwZXNER20xbmVtdDREZ25tL1Q5?=
 =?utf-8?B?VWRidXptQm1ndkRmVDYxTzIyRzNOZDlTSDhsd1ljN3h5UGgrU0lKMmlnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGcwV2M4bmt2bzQ1bE8rdjZ1d3I2ZHJueUgxdy94VW5yekZSQXBLYzVYaEVh?=
 =?utf-8?B?a3ZTNllZUkk2YnQxcStGSUxsaWVkQTV6TnFQYitnR0dVTXFXa0NuZnE0MHQr?=
 =?utf-8?B?bUk4ZHFLejluZ0pBUVZ0SVRtbDdLQlI4R3BCY0pDMjlLRFoxS1piNTBiUitU?=
 =?utf-8?B?VkZzLzRmalhuOSt6bFU5TVA3UWlRMGVxQWljZDN2a3Q5YUl0dDdCZ3VjWjRw?=
 =?utf-8?B?U3ExNlRQR3Uxd1FMZk05N0NpZ09BdHUxcnVVWFRtYjV4VDdNT1J2VnR5RnpE?=
 =?utf-8?B?TEJwa0YvT2ZZUmpNN3N1TGhCeXBkQWVKRG5na1lhY200ampZQUFQWmluUzdE?=
 =?utf-8?B?d0VXRWVmeU9SZWg3aUU5eXdvVm5kRmp0NUZBL3FtM1BCdkhWcGRZWWRKR0lL?=
 =?utf-8?B?L2JVU2RKOWpSTHJKbTgySXpiM2VydktGL1dvMC90MzNPRmJRdkw4RkVIY0hJ?=
 =?utf-8?B?UDJ6M3g0ODZVYitEMm1CZ1cvMW5DaEVna0ZtRUFVQmExZlYwQ0VYNU5UZjVw?=
 =?utf-8?B?Q2FBaDNqLzNSNjFzVlRLTzRwVXJPNHZCdytmaDFWb1J4c1JGZlhnbThlSzJX?=
 =?utf-8?B?cytuOGNpcERpL2lZcU1pdXVneEMrZE5YMEdVd2I0eGU2VWtwOFdhclVtNkRx?=
 =?utf-8?B?Qm1KcWMxT3hMdjdOTTlNdlR6bFV5TmgvSzFIanJlMjJmeVVqcG1XQjh2N2s1?=
 =?utf-8?B?Z2dpRUhTUjkxdGlHNzFxcXN4K2xHeWtYTE93TDBuUnVWYnRLUXVkNmFyZUhC?=
 =?utf-8?B?ZU9LOXdrbURmVjlMNzVZazV3WUxjRG9ZTmRCQjQxcGJjZHNUN3NDenBjVjRk?=
 =?utf-8?B?bXc2MndHNCs3SllLK3hSSTh1N3NVUk43Q1htS2luNjRaNzYwUFVTQmZoRjF2?=
 =?utf-8?B?RVZlYXdvVTFIeGxSdFZ5MUUySFFHTHRtYm9WWmN6dzJwaWEwbE16ZGhLQW9N?=
 =?utf-8?B?R3l0S0JLb0UzOXNTdmwybUlXMTN0QmF4WTB5M3dKRDdwQXdvY1FDZU5lUGd4?=
 =?utf-8?B?M0VkcXRYc2FsaHdlRGMvckJpM0dud1QrUDQwbTY1aGJ4WHV3Mktjc1Z4RTNh?=
 =?utf-8?B?U2MzSFEzY0hwZ29zVXFmUUowd3VLSTNmVjZaSTgzTTFCWENEMHJLYW1MOGhK?=
 =?utf-8?B?N0FwcFZ3MTJNT0lCNHNDZ3A0dzUvUHdPSmVFVVgxaC9lMy9Cc3hlU2Nub1Bq?=
 =?utf-8?B?RFFyYUVqTCtMNlNTSEUyT2lvaHBZVkpCM2hEOTFVNFhqNy9tUXZNbXdIMFV2?=
 =?utf-8?B?N3RVSmhndThyMmkxcmV6V2tZb3VaNlpkd1BFZm1DQUhoRFpBcE1PT2RyOUFl?=
 =?utf-8?B?aVVwS1VNUjkvWEIvTEdMQ2lxRW9pWXBXWHFvdE1OT0U0cTVjS3dMODlNRHJT?=
 =?utf-8?B?Q1QyYTNKd0hiZkt2eUJvYkRCcUgrMnJzNklNUWoydFUxc2NKVFhjUlBMY05s?=
 =?utf-8?B?NHV0L3RUYjhiclE5SUJ5c3dBV0dmMk9aa0QxeFJIOGpUU1ZzMUtxUERUcldr?=
 =?utf-8?B?YTh1QWM0Y0dEL25qeDBmNWFmZDZoMEhGUXFOUmJSRDJLOTlFNzR6U200K01j?=
 =?utf-8?B?SklJcEN4a012OEZRMXBDQ2xYVTVRWk8yYjkrS1A0K1cvdzFpbTFKdXNTWGVT?=
 =?utf-8?B?Vy9veXZlSCtjN3c2aDF4UWZkYU5wTXRLSEIrT2VjT3U5RFppdEVYaVNmSGpv?=
 =?utf-8?B?aklXVUJUaXNTVldwUzJnMzY4QytQNzhPTGNIMVFvOS9uRXlBTFRPVjFjK0JQ?=
 =?utf-8?B?ZmZJRndwT00veVlxQnlXTDV2d1VibU5XeHEzbm1xOEZyc0VTODF4KzVLY0Y1?=
 =?utf-8?B?R2NiWFpNUU9QRnQ2SnJDb0Z6K29aeHgwUzkvNWUzZmxFSyttdE5iN0puV04w?=
 =?utf-8?B?REhkYnArVkR3a3o5YnpDODRtWnRMMWorREFWdWVJZjRLRTJhZ3lPQW1VSm4w?=
 =?utf-8?B?cjZBU3F3S1NYNDlUeFdGTkJVTUN0dTkxQnlFVzZrUkt1WWtVRE93QVAvWklE?=
 =?utf-8?B?QzB4VDROL3dUMGx6eGlHQ0YyQUhob3JlVGpTcit1YlBVVUVZRm9qYnFzKzRl?=
 =?utf-8?B?RHBDaDhrQVVKK3diTnorWmJDS21CcndXSzFua09yYnBYb2pzQ3RsZEFYa2kw?=
 =?utf-8?Q?Sw1FC/XJ/w06X8AKnJCCbw8Np?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j2vSWLOEID8yv1LWe2rlfL5hjlyNSTNEKj4L8olrV+vVwBqYpv1y4clocM+JKUFtAqRsJDFbHf6Yk9Y9mctiGEI/yhAMf0gfm1ODmENXc9YmRHU6yvdNyovgZlngmolBFj1+uTT9X9kJxVYOKyIqslsO4v0RKfxwvdS5jW2+xhGI+Gq/B+c3xU5fpX3rQ+ATa1HNGjQMI4h6ni5SLlKnZCLvqjgZcv7JsZmaTcsU1zHdQy3rcL3J20SPRYSRGKFaZ/xgvx2s4kH7gaud+DfhuW5+k2UaJOFSsiJz3S+3529TY+xooj4dJ+D6xDT4ijsKhIwW8og7A4BXtO07lJLIBrvJsC+hHgCmDXQ9xV0D0BiWj26Vcf3I+dKn5mJLyqphFG5uvLl5neHIxEGepQwTeJXJ2LXkQpITluWY4qcua/2tRBLG38c1u8bH+GEE5wrZAplofef1nnjhWpMQZlt6PCUW3heIXfMI/0DIdwIESX5MRa+LCh961hr5R9w+aP+gxvjUKqpVHVjdsLtj1Wq3Sf9zaGk06Enbb8SealIh9cbGRdtiYfI/kMdtWwMgr25tsMJR0XpzX+tttJ6a82Ei5v56gU5eLR/pJShbyAmwwqc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09eeb802-ff77-4e7c-3799-08dcea730afc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 04:05:00.7097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+MWI5anCUFdpcNpYH+TZ/jRit7P4vPC0C9ufIiVfIitpvDk9T4UGdbQ7OI7J5Lv5oZwm/1ZkfDeslliAGkOnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6584
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_23,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 phishscore=0
 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410120024
X-Proofpoint-GUID: lfhd1dqr5AGEZCIZp4rz5gxz67VuZ51Y
X-Proofpoint-ORIG-GUID: lfhd1dqr5AGEZCIZp4rz5gxz67VuZ51Y

On 10/11/24 19:53, Kris Van Hees wrote:

> On Fri, Oct 11, 2024 at 06:56:16PM -0400, Eugene Loh via DTrace-devel wrote:
>> On 10/10/24 00:55, Kris Van Hees wrote:
>>> On Wed, Oct 09, 2024 at 01:45:34AM -0400, eugene.loh@oracle.com wrote:
>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>> +	if (dtp->dt_usdt_namesmap_fd == -1)
>>>> +		return -1;
>>>> +
>>>> +	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
>>>> +	    dtp->dt_usdt_pridsmap_ksz, dtp->dt_usdt_pridsmap_vsz,
>>>> +	    dtp->dt_options[DTRACEOPT_NUSDTPROBES]);
>>> empty line perhaps?0~
>> Sorry, I don't understand this comment.
> Similar to the previous assignment followed by a conditional, I think that it
> would make sense to insert an empty line between the assignment and the
> conditional.

Curious.  It seemed to me to be very common for us to assign something 
and then immediately (no blank line) check its validity. Just a quick 
sanity check (not using this file, which at this point I've touched 
extensively), I tried libdtrace/dt_bpf.c.  Indeed, lots of this 
practice, and you seemed to be the last person to touch those spots.  I 
like the close spacing, but don't care a whole lot; I just wanted to 
double check since the patch seems to follow common practice in this 
particular regard.
