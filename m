Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A71D22E3E9
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 19:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733427784; cv=fail; b=jCl0CP+z19KWiPvrjzDu7rpfHwjkxIRYlstfk5EVw9ix6yQKZFNHU3LXL2Mqn39D7rqtAMRUbFN2Bg1aRZPdLj33ZO7fp+N7LSxNk6muUyLmgGHX7klz431PVF4T7uGVb01UwiNeOVpsMGjSKtkPxkP8bH2GC+nAq7P7WOOP0Oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733427784; c=relaxed/simple;
	bh=t5M6PJiJxC8NGC1igFKA5pfWzTcuxqv/h2kn0BUSQm4=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=QTQeFH08KIA6Y2ht0LRb2rojLPLyB2qCRADjrprjv97HcL/o0TqheMmjHwICQH2mZ/NFdkHg5VwjSErvFIjQdhbIAlIOhkmI8BiNjrzEZd0L+Fe3Ad7z1tg5uKmQkrClmX4WWRyCI/2x+sE9sgN/yxZNSk8bSoPIsqg3w2m0q94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Dz1C3Bgd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zgBwdQiw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Dz1C3Bgd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zgBwdQiw"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5JBoPq009906
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 19:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=1eEauGVppTMpnCGCEpg04f4nTJwJ6/NIAbjfqdmio7k=; b=
	Dz1C3BgdJsFwGctBjs1BcD74w7cdKhKWZzscZcvEtURAS8I+pGpnPqlFp/TqUMQo
	U0hGQXQCjCV3RjiGwFWnG7+j1XLgJIXlw6H5OEspgjIs0zLdmNmgUQR7ls56yPM2
	bS9bHMxZKT7dWaHcgH5BTIpcdqROQaG//+0XzvBf32ADol02XzgYmqdY5W4mJ6vf
	x1lDiIPbbbV+5hOmAruT/C9s9dbYa8/HdL90zdmcL5JPX3OchmnF9JiboSdcakxh
	72xrZx4Jq+hnCfEb8KzogD/RXmbGdMiWlSxAM26QWDVvEbvRMUCNKppO6UHKrsH6
	B/sDwWSt379Q2KARaNJjEg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437tasbth3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 19:43:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5JWqUf020502
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 19:42:59 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s5bd41w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 19:42:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXHCQkBd63vuSgg0BZhWTYq5sVK/rXAeychHXmqhH7qlwMhHKcBt62eFUS2uy94D+lOSUdc3aIoVWCJXTFTCyDkGguouxdgr6NV+6WRw3tDTd+wV6YAE91epRxT4tXOVFRisaDU9MzsjeUTP8PzDh+KWA+eXv2AStWLYaWnPcFa0ZbXMD+nKQbtLxMwFV5+Zz2EGXX90eBZVhbcx6fOSuQgwHTPQdPOAIrIUrw9J5++Y3biLc3ZLCBdek5W1iwCvULsxdCAr/3fDQto3tCDpISnUEem6p80/rz6UNV69+fWh2Wb/nm/ok/A8mwRv9d4VyvNybedkDs6Y6e2BoTFtAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eEauGVppTMpnCGCEpg04f4nTJwJ6/NIAbjfqdmio7k=;
 b=SPWAcjf9lodCYY6fdiXiwPNgt5KOHl8NKmJFF6vCzUWk59uGcoBBn5rXKzEKM3nq4u6O4SQelR2HVZloaYCZ/FnhomSLhDv6if0BfEa4d5iCc2ELjXxio5mUxvbDQNd59B2HLRyh13VO/0EgwuSF24OaE5DC/pcTgMEJlZNl//XyVc2LRyXA7KFBO9OdP6X4n4ei/N3DWGy72D2bElR1nVnBPf3kicFuD+3K/xDV3dHUk3LkLAAV3Zazp1pTZmfMnB6VvGeAxS90pVLbarYOVKqDkdBGNhHf4nlsNVcayRdmAFNea3eKsB/GaJQ8+oJCwZrdrNkglcM3kpioxT8xJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eEauGVppTMpnCGCEpg04f4nTJwJ6/NIAbjfqdmio7k=;
 b=zgBwdQiwSVBRC9z4VBtU+F01nLgRkvEXnnxgocmK3AY+dya0LuTcz1j6OE5Ku7U05CFIwj3exM5cUZp5ZTkluWiFSksMoG+XixUXPnhfXkyK5GSkyukWz4m8/qY2LjhHhIFjjbNpQDonD8em5Cz7wDyjxcXKRq/lvoaHvlmPnpk=
Received: from PH8SPRMB0037.namprd10.prod.outlook.com (2603:10b6:510:17b::21)
 by DS7PR10MB7153.namprd10.prod.outlook.com (2603:10b6:8:eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 19:42:54 +0000
Received: from PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e]) by PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e%4]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 19:42:54 +0000
Date: Thu, 05 Dec 2024 14:42:52 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] rawfbt: new provider
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0424.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::9) To PH8SPRMB0037.namprd10.prod.outlook.com
 (2603:10b6:510:17b::21)
Message-ID:
 <PH8SPRMB00374BF4E363FDE8B36D9E86C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8SPRMB0037:EE_|DS7PR10MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fcc139a-f8bc-46d5-de2f-08dd156502ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mxPNdst762QIxejz6Vm1kJhK5nM1/BK8moDTZkLedYSfJMx0F8q6W7qGDPTh?=
 =?us-ascii?Q?JS3p2Z6YJzYW+jXbnP8kkvbrCEEQpfbrz1MhsPhk6NTNGUeWpG76MfuE8Xs3?=
 =?us-ascii?Q?luqHDwdW08TeRWmIDfnOOLvEfA8Ko2kq4bMfm0pZoc9CZTIeK+/zgIsO+ud/?=
 =?us-ascii?Q?6xb9Mj0TP2ehfMEuOaYFrZgL+KbejtdVJfJcObzXsvH9NC5rPi9OKTaEzaaZ?=
 =?us-ascii?Q?7W8IQUwIKFKKm5KeG5oMhZdiQcjGFB6z6NNq86R3d3t6tFtt3HV0Rd5C5tkF?=
 =?us-ascii?Q?/2vXA2Q15Ws+RUSrxcYJrZw8GljBzeDwJafphJ/QduVFLs8lAdV1+MVA/7OA?=
 =?us-ascii?Q?oZJC9vBNIpXXwmy7Dbunja+5jHh0xuJSrZm9iTPcsYz+I44wYmbebk7gXQHc?=
 =?us-ascii?Q?+sRHQauHlBpxDLV0Dfwyny59eDg5GGWqOJfCeozVRlqwVg94iUHbKtuVHAf1?=
 =?us-ascii?Q?UW0xgpArvmFC7ber0V+H0+lV5Oj4a86yYnJUoiSDjiF7D055UDa3YUiMvuDL?=
 =?us-ascii?Q?qC2tERvtnxRquGWVuRZcmvJStPXqhugWbIch0fNtjXo0Uvv1mB3cWggW6kFL?=
 =?us-ascii?Q?mKqOX7Yq1reH9Kbt2K/6V6k24v0vNCjUPXFs8Dq583J2YsNqVs1cMUuvJNhZ?=
 =?us-ascii?Q?4555i1gD60Qak2lkeBL1lJRQh/samqmDBTOArvExGWwycBSUnoDNKakjTt6Z?=
 =?us-ascii?Q?hD9lxmr7VfbJgr3CNr0g5ZDIOxnWDT3ipF8AGG1X4YUI3SqZVxC90b825vcs?=
 =?us-ascii?Q?AAbaZhqvEzE65bhANRsOQtk+n1ugHBS9EAFN+vWOr5KanCOjwqryqQ65GiUP?=
 =?us-ascii?Q?SkLRCkW4dHXIIbVoCMumz/d/HVRm+9HQWM/0BRDUYdd9SnLQCVa4qkscxfR0?=
 =?us-ascii?Q?meXeNbsRC/8U/jfB++aQBoiwIIE1N+4g2Rk/PipxlURqUuA3FDftlR7ajV5u?=
 =?us-ascii?Q?1g0zY/8kFfelG4/46vP5oNkHbBP7kpM6y5cu/7Q4dPZVR1UPNTIYSgGKfGfl?=
 =?us-ascii?Q?qqRkKbveATr3AgZYJMmwUFu6a0fYJvZmq2H6PuJSp9qsuMXKTJURpOrDMs2a?=
 =?us-ascii?Q?TfyBaFiBARe6FaP28PMkW31tOEFHklu0cLEkOStiqTfWZEcWFmh7wGWJrpds?=
 =?us-ascii?Q?So+nr4+xUxb5WkgTSiLEjfH/YUB/ebdyNvs7ekE0KOK7HIxrd1+JI10gN29g?=
 =?us-ascii?Q?5BRCuemPzlzOoINSiVoEuMm1p/LaHgKWJ3oIbdHbG0YYk5B8dGR6PY42UrYA?=
 =?us-ascii?Q?rPzoa/b7A62cutqonL5p4DCBcUA69MtTUwTyi2f358L0lDXuWq91pbaxH3VA?=
 =?us-ascii?Q?RxQ8YQ5psM7VXptHFRNxam8vjw6dHmgKxcm+MdROmIQA245tDXs6rKRNe4b0?=
 =?us-ascii?Q?w0mMWr0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8SPRMB0037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KAiFmK0TOKKjj6y2MOTIoMadFhV2YEUONrDUXW0RRfdpbZDj0GkFH0zriIdk?=
 =?us-ascii?Q?mnka56vm8zt6TG1uhnqM9OkrevslxPJ3OXHQxeo0xgBXEcAdF/pVEXR1oyWK?=
 =?us-ascii?Q?LQTicbYTNzfW7u49MZi9RBr4Q8n9NP9dyOwq1C6TuCQklm1W4+7OqQ9KnA/V?=
 =?us-ascii?Q?Rg4kV8TIuvEmwWa8/wg18bPqvJD+IKCYclQavvk7VlQGtaSKNd0RLzD/CJkX?=
 =?us-ascii?Q?HfRhWDM8zjJyyp5XMNPH7iPzXqICoYYlD6l6vy1c6A0BwJGcxJQyLBQwENku?=
 =?us-ascii?Q?qfxE6/powOKCfOS/xBb3bk4fwyULr3Xgq/hPuXItU67xHniJ4wClOF2VZ2lD?=
 =?us-ascii?Q?oHse0bfQOlCSUrCOf1vIMro+btq/+IM1lmoInhMERsaJl31E6NwCi5Q7jzFk?=
 =?us-ascii?Q?8Rk8mM4ku6ukjkaIWou1uGcfZJ13XWv37AmUlOOKBk1yL4Y2BHppUTpAvxCE?=
 =?us-ascii?Q?hX3iYAVVhpGMoW2/xNy22nnLj5q+079uPOSomekobu731dXsQOj683t+K1M0?=
 =?us-ascii?Q?T2VGnilKXCfcJWZscBdw5IGgo2YWZIwSoISpvi8EfhNn7M8gXRdKhepnmh/2?=
 =?us-ascii?Q?3rCnMbD6BXhRV4JRFjxS8uh0E3ucxkZzc5+opE7S+H+1FWBtCqokPccpVxWk?=
 =?us-ascii?Q?pJsLxTZq/8J1/GsLBDXTIW3hL1WqiHeID0ff4rSYdtEce3KUcpiqa/61pCw8?=
 =?us-ascii?Q?O+jKh97oxi6ROg+fKVsj/PGWYDWyD+vl1YC9fZg6VOxSjulMXEXJiuzFJiL9?=
 =?us-ascii?Q?eFo+QgUTR+HQwVyC0RR6KmHwxYpnT46oVcHjM7Rh2njQpuiHRhBTfQJu8WOM?=
 =?us-ascii?Q?feLZFfbcW4SUPXqc05jXebh2l6DZJmas4mwapK0PG6m1EbJkBqq5edks60D6?=
 =?us-ascii?Q?Xeo9HLK2NnYR05TkNPD1Lz+zU8OD9IxItS7CyQzAUlgl/SBeBMSj+oHVoPKB?=
 =?us-ascii?Q?qifXYW2k7ipfswOg2NZbdb9p/bE2sfAFSnUDK8WI1LpDQPvLafuXSWjFZdYF?=
 =?us-ascii?Q?H5M1r7Uoh6LILXzY1aIufeo4ATcNngBB0bSwOgVI/OA5fdqan+f3CpBSajf0?=
 =?us-ascii?Q?SKpBZRMS6HZgmHQ69DfZsGv+KWz6VIxp4lPsPlL0BViz0M/Y/5glqBIZvdGV?=
 =?us-ascii?Q?vGgMPqxnhXvjujcRI4zyIdRq59gR12nq5flY1vlPO8Izxvaoq2NnefkbwWOt?=
 =?us-ascii?Q?jOsBbEyZvGlCZ1D20sbmcS9PRWwV8SmCC3xFAKuD58NRc94S8aRbN2JaNlSr?=
 =?us-ascii?Q?McZPNzRh557pYbOYko0r63KONJc6TmA/WokrkbtNFeydnqkHESjYuzZRQUX7?=
 =?us-ascii?Q?fBm3KFH6GyFd6K3W173aWZthr6s7T2ezUmCAe75E04s/9ZNdm3ZdPs8NZZbx?=
 =?us-ascii?Q?D0Fp8QyoRoFhxx6D3muYAvSCNSyZAaBORn8Tsoy0mDtYaXAtJOZP0C/+oGWJ?=
 =?us-ascii?Q?8JS8Fiom2AA3x2g1QSFKk6kqQYirMj07oGngQot7w85X25po0uvhxwfYFFym?=
 =?us-ascii?Q?9dQ0laaWUhItvV+S4LvBy3Urtwn3HyHc1xqnDDmI2VY6trV+hO7e6EwwVaww?=
 =?us-ascii?Q?5oVqukcKtM73vvp0U9ekW4t2+dDeuybutDpwB72w6Yc5m1qmjdYzfPzfiEwB?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y/CxJdiI7XgIsNXr+iAC50Nw6wudP/u35izySDfwzNjmhPpL3bFAldulo6XlNxzBdq1+cw2QpW09VSdAx824I9nkpYo4wJaC3WwB05CKZI+QKpgL/tm2KsI3GxTeFu9zpKbEu8pGBP07zXFrq23sqSJb1Al4BmdqTjbe5YL7Md/mAZudABUPZPCMRcXQINV+zGTzlqiC74r1usx7n0eoTmFu9csLY6C6vZRYiwZcE5qBNZVmB3L3EMaZNqlyDvUPp7Zs+3/oo5DkWWkI+SUsG5wAjBpsYNANZGDmOB5zo7WdvB7NMEApf6WYNMv5hi+P2BXadjLHg0O60k5xKpKHmsqT4I9+iVDMRAoDCmT7fuMxmjyn76oFY6i5q8j8N+nRT9igADJ5e02z7VduUd0cxAz1wdEvAXZ0sBZ/oD4dJSDR0tHyDKmMO0EOPwKL/p6SfNaBe8eoVaw73QhHhh46I58gFnRrJtN3WD7UIQTBrcAV1Bp/BUHO2Luq6jrMcp2eNzfGt4NGhLbYrfaxFBG587EdLhszSePV8bG2AgZzzfHKX6MmpGI8F5qM5UneyvIQZEZMoZUbL7rcm8ZmLeEpawqEWcX++7lmoCeiWzIBwZA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fcc139a-f8bc-46d5-de2f-08dd156502ef
X-MS-Exchange-CrossTenant-AuthSource: PH8SPRMB0037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 19:42:54.2638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kLDjzsTxR7kFylfiwvuuFwFoMhwYMUgJO8nKQyB9VnuR3COBXju9ep9ge/mtYbkXE96PhOCg1k8JBGCByxdNIRcxIGub4Gj/TTpqmbrdIb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7153
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_14,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412050146
X-Proofpoint-GUID: 1oAR8VZmZ9_ytOWNV4cPo1b0c2zFxtNA
X-Proofpoint-ORIG-GUID: 1oAR8VZmZ9_ytOWNV4cPo1b0c2zFxtNA

This provider provides access to all kprobe-based probes that are
available on the system.  This includes any compiler-generated
optimized variants of functions, named <func>.<suffix>.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/Build            |   2 +
 libdtrace/dt_prov_rawfbt.c | 330 +++++++++++++++++++++++++++++++++++++
 libdtrace/dt_provider.c    |   1 +
 libdtrace/dt_provider.h    |   1 +
 test/utils/clean_probes.sh |   2 +-
 5 files changed, 335 insertions(+), 1 deletion(-)
 create mode 100644 libdtrace/dt_prov_rawfbt.c

diff --git a/libdtrace/Build b/libdtrace/Build
index 8d398221..72235159 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -55,6 +55,7 @@ libdtrace-build_SOURCES = dt_aggregate.c \
 			  dt_prov_lockstat.c \
 			  dt_prov_proc.c \
 			  dt_prov_profile.c \
+			  dt_prov_rawfbt.c \
 			  dt_prov_rawtp.c \
 			  dt_prov_sched.c \
 			  dt_prov_sdt.c \
@@ -112,6 +113,7 @@ dt_prov_ip.c_CFLAGS := -Wno-pedantic
 dt_prov_lockstat.c_CFLAGS := -Wno-pedantic
 dt_prov_proc.c_CFLAGS := -Wno-pedantic
 dt_prov_profile.c_CFLAGS := -Wno-pedantic
+dt_prov_rawfbt.c_CFLAGS := -Wno-pedantic
 dt_prov_rawtp.c_CFLAGS := -Wno-pedantic
 dt_prov_sched.c_CFLAGS := -Wno-pedantic
 dt_prov_sdt.c_CFLAGS := -Wno-pedantic
diff --git a/libdtrace/dt_prov_rawfbt.c b/libdtrace/dt_prov_rawfbt.c
new file mode 100644
index 00000000..edfd36b4
--- /dev/null
+++ b/libdtrace/dt_prov_rawfbt.c
@@ -0,0 +1,330 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ *
+ * The Raw Function Boundary Tracing provider for DTrace.
+ *
+ * The kernel provides kprobes to trace specific symbols.  They are listed in
+ * the TRACEFS/available_filter_functions file.  Kprobes may be associated with
+ * a symbol in the core kernel or with a symbol in a specific kernel module.
+ * Whereas the fbt provider supports tracing regular symbols only, the rawfbt
+ * provider also provides access to synthetic symbols, i.e. symbols created by
+ * compiler optimizations.
+ *
+ * Mapping from event name to DTrace probe name:
+ *
+ *	<name>					rawfbt:vmlinux:<name>:entry
+ *						rawfbt:vmlinux:<name>:return
+ *   or
+ *	<name> [<modname>]			rawfbt:<modname>:<name>:entry
+ *						rawfbt:<modname>:<name>:return
+ */
+#include <assert.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <linux/bpf.h>
+#include <linux/btf.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+
+#include <bpf_asm.h>
+
+#include "dt_btf.h"
+#include "dt_dctx.h"
+#include "dt_cg.h"
+#include "dt_module.h"
+#include "dt_provider_tp.h"
+#include "dt_probe.h"
+#include "dt_pt_regs.h"
+
+static const char		prvname[] = "rawfbt";
+static const char		modname[] = "vmlinux";
+
+#define KPROBE_EVENTS		TRACEFS "kprobe_events"
+#define PROBE_LIST		TRACEFS "available_filter_functions"
+
+#define FBT_GROUP_FMT		GROUP_FMT "_%s"
+#define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
+
+static const dtrace_pattr_t	pattr = {
+{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
+{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
+{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
+{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
+{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
+};
+
+/*
+ * Scan the PROBE_LIST file and add entry and return probes for every function
+ * that is listed.
+ */
+static int populate(dtrace_hdl_t *dtp)
+{
+	dt_provider_t		*prv;
+	FILE			*f;
+	char			*buf = NULL;
+	size_t			len  = 0;
+	size_t			n = 0;
+	dtrace_syminfo_t	sip;
+	dtrace_probedesc_t	pd;
+
+	prv = dt_provider_create(dtp, prvname, &dt_rawfbt, &pattr, NULL);
+	if (prv == NULL)
+		return -1;			/* errno already set */
+
+	f = fopen(PROBE_LIST, "r");
+	if (f == NULL)
+		return 0;
+
+	while (getline(&buf, &len, f) >= 0) {
+		char		*p, *q;
+		const char	*mod = modname;
+		dt_probe_t	*prp;
+
+		/*
+		 * Here buf is either "funcname\n" or "funcname [modname]\n".
+		 * The last line may not have a linefeed.
+		 */
+		p = strchr(buf, '\n');
+		if (p) {
+			*p = '\0';
+			if (p > buf && *(--p) == ']')
+				*p = '\0';
+		}
+
+		/*
+		 * Now buf is either "funcname" or "funcname [modname".  If
+		 * there is no module name provided, we will use the default.
+		 */
+		p = strchr(buf, ' ');
+		if (p) {
+			*p++ = '\0';
+			if (*p == '[')
+				p++;
+		}
+
+#define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
+		/* Weed out __ftrace_invalid_address___* entries. */
+		if (strstarts(buf, "__ftrace_invalid_address__") ||
+		    strstarts(buf, "__probestub_") ||
+		    strstarts(buf, "__traceiter_"))
+			continue;
+#undef strstarts
+
+		/*
+		 * If we did not see a module name, perform a symbol lookup to
+		 * try to determine the module name.
+		 */
+		if (!p) {
+			/*
+			 * For synthetic symbol names (those containing '.'),
+			 * we need to use the base name (before the '.') for
+			 * module name lookup, because the synthetic forms are
+			 * not recorded in kallsyms information.
+			 *
+			 * We replace the first '.' with a 0 to terminate the
+			 * string, and after the lookup, we put it back.
+			 */
+			q = strchr(buf, '.');
+			if (q != NULL)
+				*q = '\0';
+
+			if (dtrace_lookup_by_name(dtp, DTRACE_OBJ_KMODS, buf,
+						  NULL, &sip) == 0)
+				mod = sip.object;
+
+			if (q != NULL)
+				*q = '.';
+		} else
+			mod = p;
+
+		/*
+		 * Due to the lack of module names in
+		 * TRACEFS/available_filter_functions, there are some duplicate
+		 * function names.  The kernel does not let us trace functions
+		 * that have duplicates, so we need to remove the existing one.
+		 */
+		pd.id = DTRACE_IDNONE;
+		pd.prv = prvname;
+		pd.mod = mod;
+		pd.fun = buf;
+		pd.prb = "entry";
+		prp = dt_probe_lookup(dtp, &pd);
+		if (prp != NULL) {
+			dt_probe_destroy(prp);
+			continue;
+		}
+
+		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "entry"))
+			n++;
+		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "return"))
+			n++;
+	}
+
+	free(buf);
+	fclose(f);
+
+	return n;
+}
+
+/*
+ * Generate a BPF trampoline for a FBT probe.
+ *
+ * The trampoline function is called when a FBT probe triggers, and it must
+ * satisfy the following prototype:
+ *
+ *	int dt_fbt(dt_pt_regs *regs)
+ *
+ * The trampoline will populate a dt_dctx_t struct and then call the function
+ * that implements the compiled D clause.  It returns 0 to the caller.
+ */
+static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
+{
+	dt_cg_tramp_prologue(pcb);
+
+	/*
+	 * After the dt_cg_tramp_prologue() call, we have:
+	 *				//     (%r7 = dctx->mst)
+	 *				//     (%r8 = dctx->ctx)
+	 */
+	dt_cg_tramp_copy_regs(pcb);
+	if (strcmp(pcb->pcb_probe->desc->prb, "return") == 0) {
+		dt_irlist_t	*dlp = &pcb->pcb_ir;
+
+		dt_cg_tramp_copy_rval_from_regs(pcb);
+
+		/*
+		 * fbt:::return arg0 should be the function offset for
+		 * return instruction.  Since we use kretprobes, however,
+		 * which do not fire until the function has returned to
+		 * its caller, information about the returning instruction
+		 * in the callee has been lost.
+		 *
+		 * Set arg0=-1 to indicate that we do not know the value.
+		 */
+		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_0, -1);
+		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
+	} else
+		dt_cg_tramp_copy_args_from_regs(pcb, 1);
+	dt_cg_tramp_epilogue(pcb);
+
+	return 0;
+}
+
+static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
+{
+	if (!dt_tp_probe_has_info(prp)) {
+		char	*fn, *prb, *p;
+		FILE	*f;
+		size_t	len;
+		int	fd, rc = -1;
+
+		/*
+		 * The tracepoint event we will be creating needs to have a
+		 * valid name.  We use a copy of the probe name, with . -> _
+		 * conversion.
+		 */
+		prb = strdup(prp->desc->fun);
+		for (p = prb; *p; p++) {
+			if (*p == '.')
+				*p = '_';
+		}
+
+		/*
+		 * Register the kprobe with the tracing subsystem.  This will
+		 * create a tracepoint event.
+		 */
+		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
+		if (fd == -1)
+			return -ENOENT;
+
+		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
+			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
+			     FBT_GROUP_DATA, prb, prp->desc->fun);
+		close(fd);
+		if (rc == -1)
+			return -ENOENT;
+
+		/* create format file name */
+		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
+			       EVENTSFS, FBT_GROUP_DATA, prb) + 1;
+		fn = dt_alloc(dtp, len);
+		if (fn == NULL)
+			return -ENOENT;
+
+		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
+			 FBT_GROUP_DATA, prb);
+
+		/* open format file */
+		f = fopen(fn, "r");
+		dt_free(dtp, fn);
+		if (f == NULL)
+			return -ENOENT;
+
+		/* read event id from format file */
+		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
+		fclose(f);
+
+		if (rc < 0)
+			return -ENOENT;
+	}
+
+	/* attach BPF program to the probe */
+	return dt_tp_probe_attach(dtp, prp, bpf_fd);
+}
+
+static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp, int *argcp,
+		      dt_argdesc_t **argvp)
+{
+	*argcp = 0;			/* no arguments by default */
+	*argvp = NULL;
+
+	return 0;
+}
+
+/*
+ * Try to clean up system resources that may have been allocated for this
+ * probe.
+ *
+ * If there is an event FD, we close it.
+ *
+ * We also try to remove any kprobe that may have been created for the probe.
+ * This is harmless for probes that didn't get created.  If the removal fails
+ * for some reason we are out of luck - fortunately it is not harmful to the
+ * system as a whole.
+ */
+static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
+{
+	int	fd;
+
+	if (!dt_tp_probe_has_info(prp))
+		return;
+
+	dt_tp_probe_detach(dtp, prp);
+
+	fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
+	if (fd == -1)
+		return;
+
+	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA,
+		prp->desc->fun);
+	close(fd);
+}
+
+dt_provimpl_t	dt_rawfbt = {
+	.name		= "rawfbt",
+	.prog_type	= BPF_PROG_TYPE_KPROBE,
+	.populate	= &populate,
+	.load_prog	= &dt_bpf_prog_load,
+	.trampoline	= &trampoline,
+	.attach		= &attach,
+	.probe_info	= &probe_info,
+	.detach		= &detach,
+	.probe_destroy	= &dt_tp_probe_destroy,
+};
diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index 1e2e844e..0c621197 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -36,6 +36,7 @@ const dt_provimpl_t *dt_providers[] = {
 	&dt_lockstat,
 	&dt_proc,
 	&dt_profile,
+	&dt_rawfbt,
 	&dt_rawtp,
 	&dt_sched,
 	&dt_sdt,
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index f62137de..59a8d62e 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -82,6 +82,7 @@ extern dt_provimpl_t dt_ip;
 extern dt_provimpl_t dt_lockstat;
 extern dt_provimpl_t dt_proc;
 extern dt_provimpl_t dt_profile;
+extern dt_provimpl_t dt_rawfbt;
 extern dt_provimpl_t dt_rawtp;
 extern dt_provimpl_t dt_sched;
 extern dt_provimpl_t dt_sdt;
diff --git a/test/utils/clean_probes.sh b/test/utils/clean_probes.sh
index 8292b309..16052cbc 100755
--- a/test/utils/clean_probes.sh
+++ b/test/utils/clean_probes.sh
@@ -70,7 +70,7 @@ fi
 	     { sub(/:/, "/"); }
 
 	     {
-		 if (/_fbt_/)
+		 if (/_(raw)?fbt_/)
 		     kpv[kpc++] = $0;
 		 else
 		     upv[upc++] = $0;
-- 
2.45.2

