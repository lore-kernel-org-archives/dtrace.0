Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35928F77
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 23:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721430949; cv=fail; b=U0RKFzmPymQ3YroEK38cAh7JxbpX25qcoO1MLUqaXmPVTQZv+oeFZ4f85FTfCCLSbLCvW5/Dr0ooIc/B+TPzm1+t59cYHqC+hxteSs7+7KoGcAQSq9ins126oRMyP+7WPPhIKU3NJsB9nUAvbbNaEMN3N6/eKxbUFT6iiwzIUv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721430949; c=relaxed/simple;
	bh=KZUmhvtFPb25opFKDyzC7ykL86xLovuRUPpk7pNkav8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O8D9IJIkKewB7ygMJQ3hD2Grk3mJMV71Eph93jqHC/dEHyY0RU7A5GW9+erbiyUMxTkn6eFDiFld66+oaEQyKNOIxwfdkXuJTMZ6FookJWYJHSOKSKFLHIPSYo6FpttY8wcM4M2N8mTzwvjFNDQZeCKXrEOV45XmSvDVLxzOSDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZZiSVYvk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zBll+4je; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZZiSVYvk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zBll+4je"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JNFkYw013033
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 23:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=h5AsY/6YbYh2oFeSxc2TMflBt6nKC71a7AutmCjSOY8=; b=
	ZZiSVYvkPiUBR/8UPfdh+uTJNPlYLveGjwL4qQlQAXmGKkLJnQwqU6W9emF6gs7i
	W46TekFPXjlmOcvc6chx6ggurfYVlUf/g3jqR8FDjeEO++JQYFKCsWVG7ji+AX8L
	+uvs3bu9Zij9NPq28eexs2qY2eneUoNgONeDWwO2jh94YBUpBx8ikiodAtFOOrBb
	78M88nyeAVZ3DBOUeOLmBvbtrVjGrh/FNwYCmnNUqANlpD1PHp8Q7/EefWCzZZl1
	9QxDFBPGOiZueghPlMajiBBDCgMKYnWKy3AlBie5SbWRYUb4IKt/9tEA704V4k2I
	jMYPoaGjMRJiKGZmng9abw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40g1ndg006-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 23:15:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46JM7k0c038864
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 23:15:45 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwey7g9r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 23:15:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZ5qlGlJlGWmrkh3zBQARVhCg6xeg0jzgSyYoq9KqabnqR7ybFOg7dCVGQHGMh5E9HhT2aR7ojC76/Wo3CoymslJS0I0675zdKedzTEZBrUTgEnHffJ9Qhkaykr8zSV1VO3Vci98uDxc4Q38CPiFy1FycPx2JIDOCZ9ITuG5luCvzKxEixnfj7NtQPJA0kxVgHdJGkG6hzCgHxQxtHxlq1VKmXU3oaliiNSHA9Y38TDt/qY9LzMYwAcp1R1t5MSdmS3B1K+mn8nlwHVWcqdW5s17BTDwF8gWpgeSjDNKf2j6cPRFbRd/nLkgEv3P2CzcsN0E0B5yNTG3WZxpeadzsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5AsY/6YbYh2oFeSxc2TMflBt6nKC71a7AutmCjSOY8=;
 b=JfF6wb6737yDxvERDelOWXv8F4gHdz2IbiG5APcPMX+ladwOencHIMt9qyyye5/FX0IShjzKuaEBkWS+UaE/JrT6P7eK1O8SIvs+s8QKoAqUKAz43omfczXEJf0jOs2KmDirji/t7ykx3OkwLE7VPzp5v8guIwX9VAdPh91w7OHkIC2fS2BQX+zvx7gAzUt3Vm2aHXy7eSU7k6aYuG4+TZu1t9puVjYIFGuHO0uxJWHI++26toUwbDHxeSsihPMU8LR9vJVdogLtitPgra4pDE31ricjRpjZWIoywDym5/Wp4X+QuJk+1zqJWDRz4aPyO19fWRzKysvLcCC6DkPl3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5AsY/6YbYh2oFeSxc2TMflBt6nKC71a7AutmCjSOY8=;
 b=zBll+4jeSoGjn+sJwqPUCYnZrHJSTp9L/9alq/9M1I8pbNGJXf0ldORL+lHI6rDcXNWt2WcxiGZAJtNXT2xeRdieaXUCBQaLSerk6QkAtU4DFtjMq443zdVKAvakfnJy4/zXvIuAl1IUR8DfeedGuoGmK1Vnc40SjrpgEiqnbKo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by LV3PR10MB8201.namprd10.prod.outlook.com (2603:10b6:408:281::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Fri, 19 Jul
 2024 23:15:41 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 23:15:41 +0000
Message-ID: <832b7d2d-5a9f-b288-ce3c-1cb516e3f7ed@oracle.com>
Date: Fri, 19 Jul 2024 19:15:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 22/38] Fix aggs comment in dt_cg_tramp_prologue_act()
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-3-eugene.loh@oracle.com> <ZprQMxWRXqxRrsGn@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZprQMxWRXqxRrsGn@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|LV3PR10MB8201:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf65950-ef0f-4a53-244b-08dca848b584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VFRLaHRqNTRkaFN6SnVXTUVGQWVMNktDL2ZrTkw0elB2Q0xTQnpwbHY0NEdo?=
 =?utf-8?B?ZzlsQ0lZWC8zUUo5K1FrdE0ydFZKMzV2M05lVWh0OExxNmFWbExhSWpheThK?=
 =?utf-8?B?LytLRzdwak5rdkw2TWt6K1FtTU9Lc1hpRjROV0tzT0R1ek1HZ1FWK0xUY0lq?=
 =?utf-8?B?WHAyVUJxcmJXcm8wNkxmZmh0Z2NlaXl6bzFNZ1luZ1ltZ3UydVdMaEU1ayt3?=
 =?utf-8?B?Ujc4UE5sOXBGQURvNGt2Wk9kRk55WldvdXp5Rm9TMFJNTnRuSkFya0RLOHEw?=
 =?utf-8?B?RUpJUllVK0JhYTRaNy8wc01aZkNQVS9pL0d1R0tSQ21oL0JaNXZmczZYaWVX?=
 =?utf-8?B?cUNHZGJKNGNhRUdCUC9icERUUlpDSlIxVHBzdGdlQkJFUzRzTVdPdG5aVjhI?=
 =?utf-8?B?UE1ROW5IRDZqNG5FV3E1TGtnNm5FM2RrR1pERWNja3R1cXIzenEwODBkTnhV?=
 =?utf-8?B?dENNbWtXMXd4V1RWUGJyaTVOeVBBUlU4bG1ieVd4MXkvZUUyODhZN2ZuZmdM?=
 =?utf-8?B?RWp1c0RYZkx5MSthZHNtRk4wMitkUkRFMEFIMGhZaCsyQ1U5OVA1bElXdTdj?=
 =?utf-8?B?Y0ZuOTBuejEwMnIzL21jenVZS2JoTWtDM3RUUHhGS1JPV0NaeGlxOWc1TzhB?=
 =?utf-8?B?aUhPVDA4YzVjQ2Z3aG5yb1pZaUYyTW9uUEF6M3JBN3RhNERTZGE0QzBjMDV2?=
 =?utf-8?B?NUp1c0NaSElDRXFvdEVrdGFFbUxzWVQ2VjlrMXpWU0J6MjlFa3hoYkNoZzNt?=
 =?utf-8?B?OFFac1R1TDdWQm9PUEhVc2oza1Rybkc5WVlXaURoV1BuK2gvRDhOVkMzNFN6?=
 =?utf-8?B?M2h1WHR0ZzlUWSswcjBSKzFYdTNUVEp5TGpwZEtnY3lFZDFqSDFzdlZsTGpa?=
 =?utf-8?B?ang4V0d6SjdXdzJtQjZ4OGtlTkhjRWZ1eW9Ja3pDOGkvRndadk9wbW10Q011?=
 =?utf-8?B?VEdNay9FUWt0N2EyVnFyT2VBN0l2d29pT0R1MHdSM01oU0wwaGFPQU5BMUUz?=
 =?utf-8?B?eGx6aWdiSmJqNmpDTi9UOTZMekxwRDgyazdOTys1SFF1OHgyMnlYTk52K24v?=
 =?utf-8?B?Z2wwVUlGWHJJOHU3Y1VwdU5SdlNyMG1DR3JwOUtpNnJneW9DYUU2NnJSTWxr?=
 =?utf-8?B?cjZVamNCWVdVL3U5NEVZWkl3b3lYanROaEtiQ2pCOFBCM1BYM1R4V0hNek9Q?=
 =?utf-8?B?YkRQOWFNWUVhVmd6aW14R0NIR2w2RVFZQkw4VmhkWjZVYnVTRCtOY0dPeUo3?=
 =?utf-8?B?YmhXcTVITktySHZBNHZPQkRMT21pWVl2SHpRdHBuWmhmd09RaXVlZEkvTElo?=
 =?utf-8?B?TnBjNndEd3VmbytTeld1WWpralhFQWlxT0IyeXlBVDVLQnJTamttUzVtKzd1?=
 =?utf-8?B?UlVvSVhYRlpvZUVpOGp2enh2ZkIrYVljOGNBZExRZlFydDRPNGV1bFY0Y2Y5?=
 =?utf-8?B?ZEt1K2M3Y1JsRlBHMGF3YVpVdE5HVkd2eVR3SFhTL3RaaVpZeGdobzdCRko5?=
 =?utf-8?B?ZUpaR2IvWWQwNDA4SjNzRDRzcjduT2JUSExFa2lYVnRUSEdRV1RFeWhOVHRj?=
 =?utf-8?B?UmsrUU1CdHN5UjhCTE80WnJBa2NQQmpZYVU3NFppSXVZWHBMUkVOcHRuR3E0?=
 =?utf-8?B?bzV0aUtNN1FNSk94MXNXZG5Dakx0ckwwWk5UTU1DQkpPYS9EekVTaWFhamR2?=
 =?utf-8?B?R0RvUU1jUCtQajRqVDZFS04weEwyemZXVFFCdWs1UmF5Q05EVGdLdXlGNUJr?=
 =?utf-8?B?VjhOanlFSWxQb2dwRGxDamR1aitCN1FQdDJ0QS9HMDB3VXcwais1emFuWHZG?=
 =?utf-8?B?ei9yZ25oZ0RVVGd4ajdxQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TGoxOVVYQlFPakdzTFE1R0hjZmFwZWl6YlNGYTQ2K2dLOGFYeHloK2dwKzQ2?=
 =?utf-8?B?MXZzMWJnZXhkWTd5TW1SaGhUNjYrYStxcENYQmswbEY3MHpQTUs1NXBwSWNX?=
 =?utf-8?B?dUN5ekdhbTMzVTZWbTNhd0pDY3FLejh3Y0dqNzZ6K0U5NndzcE9KUU1scVJP?=
 =?utf-8?B?WEU2VU1nc2JXOHFhaFo1T1lBSUpvMys3bXN1bEJxWVVzc0VWMjREWUUyM3F3?=
 =?utf-8?B?TXpYR0hkaTB2c3FYUkIzenhJSEdSRTdhMW5vc3ArWFNPQ2ZDRTVVME5QM2JP?=
 =?utf-8?B?NFlCNEppQWNERDc3V3o5RlhJT1I0emdpZmtsRjl2bGcyK1ZXZEwvczhEU2pj?=
 =?utf-8?B?eW5FeGVLRzBoOHRjTlZ2ZTBQN2h6V1FQUmF1Wkp6dTd0dmJRWnZBaTBWbkxl?=
 =?utf-8?B?b0hvU0FIZHk3M25GN0ZDWWV2ZEpqeUx5SHhUN3JxaTN1WWRjdHVrNnpjeWgw?=
 =?utf-8?B?NDM0aWMzbUR5RUx6WkJlbnNmYlY4MEFvUzNYS0czUk5JVk9YN0RhczZuaG5w?=
 =?utf-8?B?dXF3N0FSUlJuNmU1NHJsTEMzMC9HZEw1SFhDTFlMT1cyVjh3cU92MGp5ZFBL?=
 =?utf-8?B?SkMySnlwN0NncnFrVlZHdVdNTG4vSmU2a1d4bW9Yc0p3eERVZHZ0aVAwbUJ5?=
 =?utf-8?B?UmdzR1c2QzkyRWp1Y3MvUzRqZDFTNGNnMjRDajhBWHI1QW5VTHk2dXpncFZj?=
 =?utf-8?B?Rno2azZIb2txTjc3dUNwTmlHZ1piZ0FweHNMUGZCU3cxTTJxTS9BR2pFV1Vk?=
 =?utf-8?B?MmVNVCtLcllvbUZleHN5UnUzUERvb0NheFFSeTZSV1B3R0xwY1IzOEpGSVdG?=
 =?utf-8?B?dEhoc01CZGhzWlNDcUpoMGlGYThwbVBTaHc1c0gzSWhEK3BkME5tMWh2K1dk?=
 =?utf-8?B?VWpWMFhPUVlRbXM3d1hpSC9xV2FtZmpJb2tSTWJXelkwMUcyUm9pZi84WEpn?=
 =?utf-8?B?dTlOWTNYVWoxb3NKYkxZc1NiQlBhTmIwc3Q1U1JEcmVrd1JWQXdjWFQvY0xH?=
 =?utf-8?B?dWdRMDVEcFgzTmdXeGE4Y0NNYjZDV2ZwL2RQNmdONmhOV0VjOWlYUCt2YUMr?=
 =?utf-8?B?V1BqcjRHOHRTWHZ5bHFMcHZZb2JMcEVJZUZHZm5SZXFiZXNmSzUwcFhuNlNz?=
 =?utf-8?B?dG94WHd5U0JIdXhCdGVLK0ZDbFVBdWRsSFc2dnBicUtPclI3cGJ4dkVPWEZJ?=
 =?utf-8?B?UWd1TmdEZ0dZbHIyQ3g5SUcydkI1NjRVeWdSYTZrblJ6eXJ0Q1NNT2NSRlRs?=
 =?utf-8?B?dkpzVG1LeDNtbzNqcERBN052dHpmSXZ0a2grQzRPWFBaNVE4bURobm8vZ0pr?=
 =?utf-8?B?bHRIK3d4RWNEOWI0aWk1SEZLZ3BDQlVQSFFMQjY3L2pwZWNkNE5QL25UOEkv?=
 =?utf-8?B?MmJ5NVNuVTBCeDlFYllaZEIrc05OYSs4b1R0NVZJZktDc1c1UGIyekJIWnA5?=
 =?utf-8?B?MDJ5TGlXYkh0NWFzMTlFdEZhemtjOTNZUTZQZHkxeG1pV255NmxjUnpGeGhs?=
 =?utf-8?B?bFFaY1ltZkUwejFrejU1bHc1MGRpVDgzU0Z5d1Z1OURxNkVnNUdva2NPN1ph?=
 =?utf-8?B?ZnkxMVlEQ1VWek40OFl4UGorODNxd05YdDBqYWpKYjZ3ZEYvUjhDamlFNTk2?=
 =?utf-8?B?U1hkSDgwS2ZyTFV5blJ2WHJQSi8yM3pMdVZva2VqY1g5SjFJQmtET2pDTXpL?=
 =?utf-8?B?WEtCdERSMlhsWk9SMi8xZWhUR0pyMTlJcnJlSzlhSlB6RXVsT0pRcFR5SzMv?=
 =?utf-8?B?NHVoNDdsTm1RWmxJRGJFR1JJazBXK2tSNW5XK3JBdU4yQXF6eG1PWkZmc0hz?=
 =?utf-8?B?bEt0MndEalFpMUZLUnBFamo3MFVWWEZVNEErQ0MwZkRTcndnSWRScEhYaTdv?=
 =?utf-8?B?NUxWaUNlM0hxMHJkQ1VBQVVSdlMzcVBTVnB2anB4c3JKWkFjdUxtbW1mLzFq?=
 =?utf-8?B?djByQ0JYT0tDdlN2Z29MelNjYmUrU1gvSFU0MFVwYVNrV1k3RTRyNVoyQlZQ?=
 =?utf-8?B?c20zcDZpa25sUVAzQjRlZE5Xb0RIdjUzSU9PR0dDREtaZXoxN1VXMDBML0JJ?=
 =?utf-8?B?ek41d2Q2Q1FySVg3N3gzWVMzTUZlSlowZjFSWHRDVTJ3ZXVYZ2x2a2E4Z2tm?=
 =?utf-8?Q?jKFWik5AbEb6Dk2ANpt4TGZ5F?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	DZ1cRkO3l20iHhtJAb+yB9fdozQOZ7X/Cn5wys6f7PQq8bHcrUKtTvlDrCMXP2eE7CEHpVWOZ3Au9QI0VodxvjOVBdFK3K0z8D2NZKZlSlVyVjNaBw6b/2yYBzkb7GbpU+H3oCpWWPoU25fauVMKCInOLk58aVqoWmTc9YNxHCX3TX44tmnoGVnVVAQQpfBSQb/WHvwoz9oslYNEVXhtV8AEwfRx9oR3a/EurpJ1YWtExrjrGbpiDzD91FMkdtcQ6gAeW0ooHyOJS3e6psG607L9QrA/4ZaR/g5qpPuDwYXPi4JzJ0f2usirawIc7OL9fT4Q5s0AVqG4g91FP778rqhjL66EkwuRUrNrSLTfNf2QDjmy0rEg7wnhGJTApQjQvmQpBadqN8cTUPH3hSR+NO20IUOq0kbkUOAAslyzG/0Lx+CSdQluxkbW/ilndlxi/yU9T3hzwu3+XgpZ4pe4mwbPDeXcXrchjH4+USs0wl1bJWFc4Q53nEs4mS12Ge6uO2pGslCDVMasnb5c5HUmlwKZndT8ioHrBJjtth/+Ri/AublvGfJelPXQTe27/5zm0U/MIHDJhS62zsVtDyZ8MmI0oNallZXUUc/LVLHUwKQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf65950-ef0f-4a53-244b-08dca848b584
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 23:15:41.8129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MV8t91ITePtRNv9HhbYqc/HiSY7grAp0fHarxCZHosum+G4ZN3KzpMC/gpzP/hZhjfCPfJ1N8rQZ1el+pccAVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8201
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_09,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407190172
X-Proofpoint-GUID: K-4bVofwicDeyBzegGicnSMcNY4mjP71
X-Proofpoint-ORIG-GUID: K-4bVofwicDeyBzegGicnSMcNY4mjP71

On 7/19/24 16:44, Kris Van Hees wrote:

> On Thu, Jun 27, 2024 at 01:38:48AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
>
> ... provided you mention in the commit msg what you are fixing.  Because
> looking at the patch you are removing a big part of a comment block but
> without any indication why, and the patch does not provide context to be
> able to assess that.

Fair enough.  I suppose I never really knew why, other than that the 
comment didn't match the code.  Okay, I did my homework and added
         Since 2dd92c02 ("Add support for aggregation keys") removed a bunch
         of code, the corresponding comments should also have been removed.
to the commit msg, along with your R_b.

>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>> @@ -372,17 +372,6 @@ dt_cg_tramp_prologue_act(dt_pcb_t *pcb, dt_activity_t act)
>>   	 *	if (rc == 0)		// jeq %r0, 0, lbl_exit
>>   	 *		goto exit;
>>   	 *
>> -	 *	key = 0;		// stdw [%r9 + DCTX_AGG], 0
>> -	 *	rc = bpf_map_lookup_elem(rc, &key);
>> -	 *				// mov %r1, %r0
>> -	 *				// mov %r2, %r9
>> -	 *				// add %r2, DCTX_AGG
>> -	 *				// call bpf_map_lookup_elem
>> -	 *				//     (%r1 ... %r5 clobbered)
>> -	 *				//     (%r0 = aggs[cpuid] BPF map value)
>> -	 *	if (rc == 0)		// jeq %r0, 0, lbl_exit
>> -	 *		goto exit;
>> -	 *
>>   	 *	dctx.aggs = rc;		// stdw [%r9 + DCTX_AGG], %r0
>>   	 */
>>   	if (dtp->dt_maxaggdsize > 0) {
