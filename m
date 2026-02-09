Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B62E314B8E
	for <dtrace@lists.linux.dev>; Mon,  9 Feb 2026 23:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770681171; cv=fail; b=TQS5zadJ455Ocm0kO1URuxpK5SPrmT1Aezx0Od9VZTgDfWa7C3/cIJPlYVhiFWDU7nT89HhtUY5IQPLh3Ur6RBSokpeBZ2cS8ODFQUgkAJpg0C2q75t+iJVVAJ9fCirOU5aOeceTuMws9GZkyLVxxuUd+CbuSxX81KLheeKUV3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770681171; c=relaxed/simple;
	bh=2kF/OJdLIxjmuDuqiZeG4IaVrMldnqyP8hvq8Mx1RAY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hjWBkANu6rpuwUd7q85hmlQKGsLQ/O2jutOEooCEhz/L01O9lF89Ru25uRtZrMCGiQqNPyGZTQa9+NpYlHaQaFiBGnu6k2RpAWegnwavbdEbFC1Ua+0c9BsS3sMHF43vuoI6f/5uMiXyBBaHaknrRLXq+P/7Q9g6wOciKPYanHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LWyxTxtI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qsiLc0VG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LWyxTxtI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qsiLc0VG"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619LiYTE2924656
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 23:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=WAqzAYaLsnzizbSMfZZ8xevf0/O3WKvzWyrO5aB13II=; b=
	LWyxTxtIPYyKoBW1iPG91QRqdKUoxZ50c126jKLnS+7CHnYlDAQsW9nMFC8omKv+
	0avj/FxOGCb04ToTIwJ3cV6c/UFomwEH5YYaPX9JL/TIxPqflwoLwK5lUSTGMzbh
	uXZLNlbx2OGqasrps593XmRxK/EfeVDLKCEvwNMBWgzjn7C0tT2fS/euTLt3W7td
	/vJT3lkmXCOCCuDphl5Utn9ysEscRKPgHuoFxVTKGtY5QmFx/Xb8wMkzY8lFc4ed
	pC9f2FetFH8PDxZP5KxO8pjdlcYBU/Jytcn80Fcz9nM9b1ykm7JY6NSk0Mb7NRc6
	0fauvwDHW5N+6zhVwiA0Gw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xf3u3yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 23:52:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 619M1AMe005188
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 23:52:48 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c7jnqgtfs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 23:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+g5hpQES4pGMUF1gRUHsX2zwKtRindbzHhB8THYwlqEXL/5CCC6r5FcgSAicvQOKynW64ZSD1S8tLIyQZIUgYJJ3BpD/cxByu3hJM/4wr8wmZPeR3lX3+JGpNl0VAxTpkiwJ991m7tnmULogtHRZDGPjIqQKia+EqSe8oaG3D5Dixvnb9ydBaDKNTIhucEGXMPgwDmmnwRKG5ngYdTuhJAMocL/fD3IhPcONoNDGNcZ7W/ztSt9eVeIvwDGdqpYEynr4W4HvkyPL/Oed7tdZE4c7floKBkA03bd+dGJF1w9VeH+fk4GFdMOCpLCQApH5x0FfWljQLRZPYBY180DAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAqzAYaLsnzizbSMfZZ8xevf0/O3WKvzWyrO5aB13II=;
 b=usrC26NuVgffzaSiO8YYX9/Po4g1vxYeHvM0FbgIc6bdWJdcA/U+xqflGbxJqVP1cfisvCy1s/0M6ACRt0wrRyEKQzbQS9xnsL/sC5VK/WqIGUAW6CVZ7pmRw6KIJMaUL7LHSnnN3PgQ1+pII932DZbQnEsm60nDJkH4OdWi81KpDEXPjAVhjoYaCv0AjjrL9YBCNv045WM78pCVO+9xsHGg8HvQ6VL5qs0L5BWLdroLNY9NWwJZGmtX8ywmHmrJwnryya2lt1O3AJ/9uqf+1PFGpCoTsdKljjghKqo5M/U6TuVAFgbjyHJhcgP3mXTfHIvlALosO7d4+d0nKtM9yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAqzAYaLsnzizbSMfZZ8xevf0/O3WKvzWyrO5aB13II=;
 b=qsiLc0VG98JDSsN7WYyTX8ZWojZ8CVn0CRAujv1EebiZ9tJ5BGOSdCPFIg4itNBtZs2PBXc9QVTHKVzlwXvZf6dMXDpHnBpjZMTP+QwfVDo912a/SxPKt0WoCvAkDLkOAniJZ+PX/piunh4O/njSXDVPh7JdWvgmlcuYfRnG6Kg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6460.namprd10.prod.outlook.com (2603:10b6:510:1ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Mon, 9 Feb
 2026 23:52:42 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 23:52:41 +0000
Message-ID: <52a0dd3c-d946-ffa0-dd79-44aeeca99d16@oracle.com>
Date: Mon, 9 Feb 2026 18:52:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/3] test: make tst.dash.sh work for position-independent
 code
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB75221E0927D3E1E80DCE5EDCC265A@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB75221E0927D3E1E80DCE5EDCC265A@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR19CA0070.namprd19.prod.outlook.com
 (2603:10b6:208:19b::47) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c194c50-241e-4b11-3263-08de6836501b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N216YWRvanl3WlBITkdnd3pUUkhxeFp5QjMyRUl0eFNEOEY1VHcwdlV4Q2dT?=
 =?utf-8?B?SGgyalpya2w4amNWdEZiSjdJaEVlc1lLdnNGLzdkK1lWNllORjNURTBONjNP?=
 =?utf-8?B?aVp3Y0lKcWo5MnIvSEtUSmNXQUtzSDJIeWhVQUVZMGNHRVJCSm8vMWpLM3dN?=
 =?utf-8?B?QS84WFNOSzNVT3M1cFBhb2FINVBDbVBZcDJuM0lkMjN4K0NDYjBISGNQTDNY?=
 =?utf-8?B?ZGVCYXRQN3RkeklzZVNteGQwWmU4aGY2ZHg5dEV3TlViZm1xWE5tTkNzNzRt?=
 =?utf-8?B?MEdSN0dTWjBxeGRzc1VPdUQ5SGNVN2h1ZnF4OFpKK2lQbGliNHJTNE12NTYw?=
 =?utf-8?B?ZkdaV1VCd2YrY2dvUXF0Rll3ZTlXNzhnblR3UVpjaEtEbVhsTEg0YVVKaFJT?=
 =?utf-8?B?TElucFpuRTRLQi9XMFNIclFINmVwQW9zendvdHo2SnpzenZoWVFWUjJ2VlJU?=
 =?utf-8?B?SzhZUVROOGhTUG1IcVRSaEtaTzBBa2RqWTVoQzFld3czRFFBYTBwMWQ5K25Z?=
 =?utf-8?B?SjdDUmNNajkwMnZTWVpGbWJtcExDK2psZk1qbnFvcm1qS2szajBwYTdzb3JG?=
 =?utf-8?B?QmxQVGR0dFZEUWFPYU0xT0MyWEladTIrZTVobkY4YS96TFJwRWsxa1plRzlY?=
 =?utf-8?B?S0JYbXFURUJDc1FLMEIzcXkvR2gzaU9hTzQzTlN6RFo2ZHZ4eWxPU1c0QUpn?=
 =?utf-8?B?UG9QSTBuM1hTVUdvK1JsSUhURkNaZXRFOVp3OS9NcmZsTTNTTXhYcktTKzVp?=
 =?utf-8?B?RTFDTzhaekMwSUFYMnlnZ3BEUEdXNHpEYXNtcFBFWHNudGx5dUJnRjIzTHdi?=
 =?utf-8?B?bFdFWXR3Q0Z6Q2drd3ZsdDNYVDlRcnBIQXhUVTdqdUI2ck5qbUkybGZ1enhK?=
 =?utf-8?B?dzRMUmpvZEpERGd6MzJaOStMeFlxbTZRb083RGRQSlFjcGYxbUFTQVVvdk43?=
 =?utf-8?B?RU1YRFlrRGsrRWRVTWJ1RUg5dVozakdtWjE2aWtwVThiWEdUVnBqR08zc0VZ?=
 =?utf-8?B?UXpMTktoYy9tK2UvYUxMbzNFNHM1K0hDV3NmbWRJTktub3l5ZUNsc3Vhckh4?=
 =?utf-8?B?Zm9raE9yQ3pwRGNJS1JxbFBkMmN6MXFtZ0FjNVNsUzRkUjlLMmc0SWw0aEs4?=
 =?utf-8?B?WHdEdXZUdWtEL0lKOGRvK3JGWDVKbzdpYmFSQktnU1dYK2xpV1c3UnZ5Q0dH?=
 =?utf-8?B?K1pUYXpSSElOYkZieVJWb3Nnb3dmTGxZWWlscnhtK2lGbmpjcmIxWVNvM3Zx?=
 =?utf-8?B?RHkrVmVwSHA3M3luRlg0T0VEeURiYVhMOHhWUVNHcCt4eEhoc09MRzQvRlJU?=
 =?utf-8?B?bEc0Zm8zeWRJNkdUMlFiZHF4MmlTcHVtMkRRUzJsdGl5NDNLY0ZZRVdZRGMw?=
 =?utf-8?B?NlRuRkxCVnNiM25wMkpzU3VaaWlSanY3aDJDVUovL2tHa2FQOXBOUlZpWkND?=
 =?utf-8?B?R1d2VDBaTTZLV3VnbEc0OTgzZEpSdnl5M3lvQ3JBQm5JT0FMQ2JqODVVVTFK?=
 =?utf-8?B?eVlIZGVxbHFZNUExS2VrZmlvQ1pnR0tNRjYvUms4bWNYVUhTSkIrV3RteDRC?=
 =?utf-8?B?Y2NNSm9FZEExMDJhaEdJNFlXOGxIQzdVSlJzWjFSRFlkdEt0OUdZZWRXMkpn?=
 =?utf-8?B?ZlVNNDVDbG5mS3l2ZWRKZFJhUVh4OUJ3ZlIwdFVJSUVkMWJCUDA1a2dxa0ZE?=
 =?utf-8?B?SDZPU3d6dFBPRGpFS2JLYWV1c3NSV1RrM1RyNWVFSTB5U25JWEUxL2FBb0tT?=
 =?utf-8?B?RGFKbSs4UW83MkJ4VTRUT09qOFRCV0diMG9RZEJ3ZFZEQmhyZFdRYkNLVjFt?=
 =?utf-8?B?M2h3anBPa0s4Um5pdWNNc0E1MTU5b2hiZGhKbkhnc0Q4dGt4aFpvS1NWNnNt?=
 =?utf-8?B?Tk5tbHVUTWJONXREOEUreGNGaWIvYWNSNm13MS9RRmdrbGU0c1cybjdHemRn?=
 =?utf-8?B?eW1IQUpOT0tKQmxNMHhEcUl6SnFDWGcrYWlxVUo3SFpkUWlKd21OaXZJMWlW?=
 =?utf-8?B?bHpwUWU3Sk1zYTc2bG1OM3h3YWhMd1RLRll3elRDNy9qTGZQL2RHOUgweGVp?=
 =?utf-8?B?bTJ5eVdJQlg2djNiQTVTWlFKSnpQNXZ3K2JvMmxCRmtJcFg3V3BEL0lTOGpa?=
 =?utf-8?Q?CySc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUpOZWx1aWZTdDk1ZWErQUo5MTJteDFhNWFKZnk4NkQ3VEgzV1A2c2pOdlB0?=
 =?utf-8?B?UnNBdmZJQXowdVhGZ29YaGhMcStKNWYwblRHNHVjWFl2Z04xUHlOdVFQVEVm?=
 =?utf-8?B?eElBRnBuM3M3dWo1QzZPczhoY0Z5R0FSV1Z3TWowcFNLYUhpNG92Z3hnc2d4?=
 =?utf-8?B?OVpoUGRlb0t6VFowcldTS2JoUUdDNnhPczlhRHEzcTBQa1B1cFFVL2VDM3No?=
 =?utf-8?B?cDJqOGtkcUFqZkxLd3pLbk45cUppeUdrZFBSU2czY0lENHdBOXB6Q1FoT3ln?=
 =?utf-8?B?QzRKTjczTXZtVHZaQ3dMRlJtTjIxdTFwYUhIV0VHbGFWWXdVaFdMWDBVbFBk?=
 =?utf-8?B?N2dkTkdwb2NLeTg0cW9qRVpHQjA2c1g4T08vK3V1TkFuV2s2S0lSanhHMnNs?=
 =?utf-8?B?L1RIL3J4YXRCT0JUbjhzVklGSXlyWi9wZ3ZoR1hPN1NvTE1NeXp6Y3BHSkRD?=
 =?utf-8?B?TFRPcnorbElGNVNPM2EwdmkzKzZQc1FEc0pLMFpNRHM0ZWZqcnZLRFlnQTNG?=
 =?utf-8?B?c2xiVmJWQXFiU2IwckRYSVdKWDViemxaRzU1RENjWjRMTUFacmhUa1RzL3B3?=
 =?utf-8?B?enZIRFlwYTF6NkJSZW8wdkxmQWFQM0JPZFZZNGUvVlZLeUxqTDJtVDAza3V6?=
 =?utf-8?B?VURvTzV1a25PbUpDRzVOT3h6NFlCai9iamRhRFJjT2Fza0M2R1ZMK0cyOWpP?=
 =?utf-8?B?YUIwenlzYXdYZTBUVHNzaWNKVVgzcmxtMjFGcUNoeFA4MXJzS01vUHJHL2Jx?=
 =?utf-8?B?RUlPRzA0M2NVNlNkVUZUWDhReHFLK0N6UGNYYnZ1L2xwTGdzb1ZidFVXYXBP?=
 =?utf-8?B?czl4TUZjTE94SEVOdzJyN0VqRVNhemtObkJDSHNwNStEUE90dDBkTDYyWXpo?=
 =?utf-8?B?QUg4K09OZXE5cU96Y0FWYS9tQXEySnBsS01pT1lZWlV1bFFsOGdHdS8yZzNa?=
 =?utf-8?B?TnJ0RVBwN1FYY2RKbGpZVE1DSFFmem5tV1hSUlpnWnZLaWJ3VDF6dy9DOG5n?=
 =?utf-8?B?VnMwTXBNM1lBZVArQWl2dUJ2MW50ODg4S2c5cFBqSUFoVjBKaWQ2ZXZRdW0r?=
 =?utf-8?B?dVVXR2pjcXJkaXBFeDZTVUoxYnVrSDVjOFJpSFR5czNldkFma3JsdXU4TFAz?=
 =?utf-8?B?bSs2Rk9Qd01tcHE2U29weEhJL0d6ZHhhM1cxYS90WmI0eldOSzM3ZjMwdnlR?=
 =?utf-8?B?VVN0aUNVVFcvajdXVFVkTHhLZEUvaFZkQk00N09DYWZrVXE0SU5MSEVZN09C?=
 =?utf-8?B?TFlIVnhwY1FhdWFXRnBUOWk1ck83QnJvSkhmeUM3c3R5ZGdDM0FsL3RKZHJS?=
 =?utf-8?B?Y0Rockh5WmRsby8rblYzTWpRM3ppMGorcVNJZ0xOOXR6SnJZL0VvZnJ2OUxr?=
 =?utf-8?B?eXBXdXIvdGZxZXFGWGw4aStvdzROZjlnVEp3NVZrcGxoa0F1bTBBZDR1RCs1?=
 =?utf-8?B?TEVBWStiLzVvVC9LdFZCU0pJcU8rWXFtcTdtRzdSc3JSY0ZCYmVNVXl1bDVD?=
 =?utf-8?B?bGZiY2FuZWc1dDNvZ3FXNzF1WEZLUUhGVGw3UmlPYmRGMTIrWGdJWkk5c0Vx?=
 =?utf-8?B?SnNnMk5leWsweUdGZEMwU0NqdmtXRk1VaTdXbVhiN2h0MkdSY09tM3dkQldR?=
 =?utf-8?B?QUd4UjZWRHgreGtyUXdUOVJLZkwyUzB4R2p1QlA0b3pia0tqOFIrZnZyMHda?=
 =?utf-8?B?ZDUxZmNsb01oRHMzYXFFQ2paQjZreXJhUnFuMUNHL2xBQWpqY0lhOVlaS1N2?=
 =?utf-8?B?a2RMOWFQWXBsZ01MS1NHRXgvdGx1UmdpTFRlZjVhU2hQblo3SExScWxBY1Iw?=
 =?utf-8?B?eC84dlBJM3JQdXBYelNWN3hTL1RKa2JJWXBJWGhNcUhYZk1DK3J1YVdYTk5n?=
 =?utf-8?B?Nm1sMFlQaTNUNnFUeFdDZ3pDWDJDb3dGRGJCUHh6Q1FxUFhEaGpncWFDblhX?=
 =?utf-8?B?M28rY3IxbTVZR1RKazJOMTFERVhQVm9QU0xpdzZIaGI0czNkNHRObko1NDh0?=
 =?utf-8?B?Y2NNL1g0TnVhK1k4d1NFT2IvUXM2aWhSNmd1Tld4eDAvbEZGSWEyMWFIaVlm?=
 =?utf-8?B?UFFyVDdoWWVYZzZwSlFRTEUrSWQvSGsxQ0Y2cEZqNkxBWWZHVEd2YTR1SWNC?=
 =?utf-8?B?dnFjaFhZMTFVZ3NmUkpMQWJmRlpMd3dyK0dLYlRNdTlFeXdDQTdWRDVhdklx?=
 =?utf-8?B?NTBINGlYYUw5VHBXOC84MzNLQm9idEtuOGVmSjNDY2xKbXA3QTVHRWY3TnFX?=
 =?utf-8?B?YzZaQXlDKzFWNVZsejBwdENxMmdiM21uQ0R1UGJyZ3pRcVhTY2t3R2FNekRK?=
 =?utf-8?B?Ympnc1h6RkJ5OWE1UXpUMlBERVJQMDQyRG0rdlRLTFpSK2RiTkNJZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jieb1PxPsd49fz2ivhve3o3RNzOuAKh8ImM2Y4TjOQihx7H7VtjmOA1r23BEmBExojO2FlNn/rH2L4Ib9Fd47QQ9ISiUxChnrLk/hkVmjPiOkNUZRO7jpxNuVvpFXxffivBBRDVlFc5b29bkbvdKqVpDzt+52im1xp5f0jKMJMKaZt/lMFRoZ0l3ar9Uq6DANa6mZOhb8wBTWSPUrGl64IEjxTd9i85CYWSDHjfIo/tYXjs6x4SopgvQKiQn8aQWcKTUJxX5eJ13EYggX9fOFBxoa+AKJO/K1azVk9jAlWbfzoXo9d0+1im/WWkb0QYHMrsGSdSC4x1GDraNNA6s5W45II4bqi8Qya8hrkdvSOk5Y5GxGzgaO5jOENIvyCkTFKI/G74xHoTyC3PCY0dHMu/lU1LvqOUsv1l6ryoZUnaFgek4p601w7/a8yUHf8RqYX9TIBHddS6iJw5oRne3TY/tF+cVGcXhugxUnJEEcFBCOMXQdxquie8jtbcc+eTmpWoeUgNHI8ypTJ2DBL67PDGls8YcEFKD9YUfKfTE18soNxAYGFnNZ4M7Ey+tm8aXv3jcMK9dqPx+99YTAmeqYMHsFKktqGWcVVW/YULqyoQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c194c50-241e-4b11-3263-08de6836501b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 23:52:41.7261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AF66aHV8Th3Jc3K20hzQWx/zmty7Nkhvx5vEIDVIWXZCxc9Ap+JVNTDF1fugo9roPSjP9iwFJweX/thU2C7lQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6460
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602090202
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDIwMiBTYWx0ZWRfX50n8RaU9Ihql
 sxAz2VYjUcTLYj3WbeCYGrG3PHn2BVKbdvaaK4OcUt67glBu/TFFPpPWu2XIXCG0+AD8b2Rx4Sj
 9v9XF6SP43Zc4CYaWtwFMk1XBp6JNO+ZhFnFdBk2OETdKYj+beg+VSMlBUAr5zhwLmxHeYc5D1v
 TYJ4NKSzo2MOqmQrS/Lc0tCO0/0GWlt49ogBp6rvjxckqr6SiZnIcXoZqd85AUTzdS9wipYlQlT
 7tTJFE93kzu73bnlDtOcXJsi+ebDWEwTuBKWC4sexInDLSX/f1Ej0MnTs69p+Ca3OCWOt7K9S+D
 SW8Ei9F6B7B2fFmVryKr87VtpxZ/5NWwSFtsFLkaV5DpQ+uDQv1fq6pYPO5nL2/tnLfObbfMIXb
 eIEnqLGwgseRPQfYPwqlNov/h2ysGiZ8HPFSmZYm10yNE2JcV2wpYMirIf/1jbHqhZ4M4a9Vl0F
 UGbzAwr/BvJa1jMOcvg==
X-Proofpoint-GUID: PBk8S84-n5toTyckUi9531hCbp30mLx7
X-Proofpoint-ORIG-GUID: PBk8S84-n5toTyckUi9531hCbp30mLx7
X-Authority-Analysis: v=2.4 cv=KLNXzVFo c=1 sm=1 tr=0 ts=698a7351 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=yltuoPsxTzmJ1YORRhgA:9 a=QEXdDO2ut3YA:10

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
though if you wanted to get rid of the two commented out lines ("Write 
the expected output to the compare file.") that would also be fine by me.

On 2/9/26 15:43, Kris Van Hees wrote:
> When code is compiled as position-independent code, the logic for
> comparing the reported PC at probe firing needs to adjust for the
> fact that the reported addresses are absolute whereas the addresses
> obtained from the executable are relative to the mapping base
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/pid/tst.dash.sh | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/test/unittest/pid/tst.dash.sh b/test/unittest/pid/tst.dash.sh
> index 0289b609..d793e081 100755
> --- a/test/unittest/pid/tst.dash.sh
> +++ b/test/unittest/pid/tst.dash.sh
> @@ -1,7 +1,7 @@
>   #!/bin/bash
>   #
>   # Oracle Linux DTrace.
> -# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2025, 2026, Oracle and/or its affiliates. All rights reserved.
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   #
> @@ -16,6 +16,8 @@ cd $DIRNAME
>   # Make trigger program.
>   
>   cat << EOF > main.c
> +#include <stdio.h>
> +
>   int foo0(int i) {
>       int j, k;
>   
> @@ -46,6 +48,10 @@ int foo2(int i) {
>   int main(int c, char **v) {
>       int i = 0;
>   
> +    printf("foo0 %p\n"
> +	   "foo1 %p\n"
> +	   "foo2 %p\n"
> +	   "main %p\n", &foo0, &foo1, &foo2, &main);
>       i = foo0(i) ^ i;
>       i = foo1(i) ^ i;
>       i = foo2(i) ^ i;
> @@ -85,8 +91,8 @@ for func in foo0 foo1 foo2 main; do
>   	  }'`
>   
>   	# Write the expected output to the compare file.
> -	echo got $ABS $func:$REL >> dtrace.exp
> -	echo got $ABS "-":$ABS   >> dtrace.exp
> +#	echo got $ABS $func:$REL >> dtrace.exp
> +#	echo got $ABS "-":$ABS   >> dtrace.exp
>   
>   	# Write the actual dtrace output to the output file.
>   	# Specify the pid probe with both relative and absolute
> @@ -95,12 +101,18 @@ for func in foo0 foo1 foo2 main; do
>   		$dtrace -c ./a.out -o dtrace.out -qn '
>   		    pid$target:a.out:'$probe'
>   		    { printf("got %x %s:%s", uregs[R_PC], probefunc,
> -							  probename); }'
> +							  probename); }' > addrs
>   		if [ $? -ne 0 ]; then
>   			echo ERROR: dtrace
>   			cat dtrace.out
>   			exit 1
>   		fi
> +
> +		awk -vfn="$func" -vrel="$REL" -vprobe="$probe" \
> +		    '$1 == fn {
> +			addr = strtonum($2) + int(rel);
> +			printf "got %x %s\n", addr, probe;
> +		     }' addrs >> dtrace.exp
>   	done
>   done
>   
