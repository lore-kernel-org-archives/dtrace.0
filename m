Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C299C3A1E64
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 21:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766094877; cv=fail; b=AZDHbayzJwxFcSMCv9oOB6acx7hXVjibOChkUnQqvFZ8mW5bO1+ZB8e9vfBJoiw6eSt1fmJcKgvyKnezuR4t/bjwj4P10oD69KcWULncbpDbLYMYfVhoGcoT32mIq/Cw3hoKTLA79r5hGtmczT8J4Xcqdtt2SIMw7Zq25gsvMwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766094877; c=relaxed/simple;
	bh=js7/jDtKzfzAzEKmbyPHofXQqZcvG3cmMWASEb5yzpk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oc5TGurdiX44VOGLo9iwuAbtQzqmNOTJ078nvA435upmlPhawd/YPywb20ePoDwvNy15BUX1OQb92XVvi+Dly9KWY9pt61k8yvP/eb/1gtO7ZmYuuUVrF3pFgxML0p/+HW8HpwUtBbyMjb3aCRt4iwqrdzdRkBfoNfx6zFiA/wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F+0j+YjO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QDvoQKKX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F+0j+YjO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QDvoQKKX"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJkf5J1641768
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 21:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=dD4esQ2S0vCHd/f0Q6nDujDZqlBc14MyYXe+IuBQJkw=; b=
	F+0j+YjOQLvDokTGElMHyOumKOeyOJgir2bLXJns+6oP3PLpy5pQlIo2PG7NJ257
	qNY+3WwurZ/1aFlzao5FwobGZMOHpFu+8yMwLk0r/7XLj892WhJwvmqK7r9P6FiI
	mS2zK7Cnw/kpiCX4LzE6t+DXbZNGv75P++JfCJTOMv8bvpmmj7Ajt9OHuRVY+Ff2
	jXoaohQWzfGr96ekPilpXgJgAcq7K0f8EEqeJ7u35VK+ObQP7HLxfcqC5PGrVASm
	aq0do3zCbBeQlsr3opTVw4dO8TxsKmVpIFfLLHgmMD1cSmE3U+wvVXpINAOREj/O
	7XaQBaewdgYaNcPUiLeALQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r2905mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 21:54:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BILTDTo023460
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 21:54:33 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013054.outbound.protection.outlook.com [40.93.196.54])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qta4vww-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 21:54:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJYFNu8kh5abQ4d93h4cK4QpjmSALrpYX6Iv+3rmPMt4rbfu5bMGkdsNVqz+06+5lU8YELDzRufBr/RVBqWh6V1DndC/E45tNpC7asQYrNEq2L9aCHLRsMJZVt11ng/AD74Q0/Dsv0nPWw+R/1UfZxLLqtZTpvY13DHLVGluB5jR8p13bTjFbzEbVrjzuaYsUGAw6OQOWybh7+/zIzx5/TWdCdHPSVVDPKvMjmidRhYnQzAYST1a3f9IYsa2AqwnsuIE1dbxENTrRUFMT/dCulWR+DGa8HfKjQrCByFHZ+VJdNq7+vxyUX4yLpKg3D6XBH2ZMZNvquCNrwjpkSZLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dD4esQ2S0vCHd/f0Q6nDujDZqlBc14MyYXe+IuBQJkw=;
 b=kEBGQy4F/fm/UX4JDA8piG7hKawIebySZZ0xwMTA/57zFHUQozBvCyO5Q/awysnOlKk0iEKmdk5AWOd8Nepxroe4E7rCdKs2btGaSUGjUZelZXzu+GVrOMZ5/tnlHWkBOB3YLEwmXbjWbiEBJ2maEF5NxXtC+xGaJDliqCelKvu0UR7YC/ayYFTMGHvPX3FoVlEwkXwpJ08yjTQOMGoTUntDsH/hdPB+Gdszfz1Yk5EKRpHWcEmUW69jE8DyscI5MFQzj+PKox605j4SldAsdMNo7zlQeIvGEMG4BgPhtFxXPC4yHEg2l/ZoP3fDW4SKy9F04ozM5mp/SZCjGABnxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dD4esQ2S0vCHd/f0Q6nDujDZqlBc14MyYXe+IuBQJkw=;
 b=QDvoQKKXYwg+5So9c0LGxKPNAgBsbaNr2TdIml7ulAJMyc4zaA6bJ0KqYCD/3H+KzfDisRLHIw1l8xIMrxhd3rtAbkOX4WC3KxJp5ZONOPR7BsWvl5yGv4R+5wpGDDef8Ay0QAaCucSvb24xhPFlQQ8op0r5KPeKxuzQfwahs+Y=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB7129.namprd10.prod.outlook.com (2603:10b6:8:e6::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Thu, 18 Dec 2025 21:54:24 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 21:54:17 +0000
Message-ID: <a824d48f-d280-3376-94e0-998373a63855@oracle.com>
Date: Thu, 18 Dec 2025 16:54:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] test: correct file permissions
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <DS0PR10MB752274F3007546F6860EC932C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <afcf46e3-ed97-8bd3-7bb1-8268df5660cf@oracle.com>
 <aURhb26qwDFCqmKk@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aURhb26qwDFCqmKk@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH2PEPF00003850.namprd17.prod.outlook.com
 (2603:10b6:518:1::72) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: d5fb2fb1-c252-4103-938a-08de3e7ffdb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVlaL3FJYk9ZQ1dxV3ZIS2hyOE1RMUxHL0J3ekh4YTJ0U1l4UzZxaE43UWJ6?=
 =?utf-8?B?RWlGQ2xtT0FqKzNmUlVxbmMxd2J4T0dERnpaQVgyblFFNHpPYzlLbGhUWDRB?=
 =?utf-8?B?em5OY0ZGVXdaR2Qrc3BGNFQ3bFZGNGF5M0xYQ2VwR2RsK2UzakNDcHRjMldj?=
 =?utf-8?B?cXFjSWVoSU9YQjlFMkdGQ0FzYVRqNmlIYnd2M2YvcHFQaW1DRzAyWkROODRt?=
 =?utf-8?B?RTIrZkVINWwxZFJHK2JoSmVld2NzZXZ0LzNWblZGemNscnRTUVdwNGUwL1Yv?=
 =?utf-8?B?WERLMW9GZElnaHlXZkE1QmhRZ0c3N0c5NWltUXBnZHM2cVJlaDBSR1RiR3Zq?=
 =?utf-8?B?cnBwZCttTGJnTXd0Ry9rVTg5Z3ZDVG9hOStMb0FLQ3B4TXNObkxYZENKYXls?=
 =?utf-8?B?T2RnbElOTWh4Yk00bUd4a2l2Z21WMm9VYWplcEVET0NCUjE0Tm9tTXk2ZG5B?=
 =?utf-8?B?TnZhTEZrUHlEQTBhekxXMnkyWVdVSjN6STljdTYyMkE0ZFlTNUViL3EydHVh?=
 =?utf-8?B?RG1tVkdYRE01MzZpTTlRYnRRMEdMMEIvM050cFJrTFdlTEhkSzVMQkd1WFZj?=
 =?utf-8?B?b0lMOC85aU5mK3RMNGtwQ1VUeXV5eDQzdjRLWS9nc05LcURudXB3M0cvRTUy?=
 =?utf-8?B?YWJ1YVVyK1hyZ1NuQlNvSVhnendTRFpxalBUK2FkQ0tMSVJZNlhla0J0a2RO?=
 =?utf-8?B?M0FPQ3VPdEdKN1Q4Um5IZHFyZVV3Tml2M3JwT0JoVCtHVHUrSFY4MU1TNWF6?=
 =?utf-8?B?K1ZSeU1STnVtaHU3b0lUbDlWeEZJcWhTNDE1WDdCRTJPR1l4TkZzbzVaQm5H?=
 =?utf-8?B?UWJTa0V1cXBsWXlQYmhHSlAwemU5M0ZQWnlyaVQvS1hra21UbEZHZXAwUWFH?=
 =?utf-8?B?a3lnY1M0UEhQZkpWZHhCQ1ZwNDlabXgxUEhiVjhSUVdreHpTeFFGRzZ4ckky?=
 =?utf-8?B?ZGRXZ0FvSytiODJIV0JYTnhVWUVUcFdBQXdjVFJHdHRGNURoSldTbXZBTWth?=
 =?utf-8?B?NEZqS0YxSFdFOW9JSk01THViVm5SaXFzRm9Td1Frd1B4Nml2UmpGckNtVU9O?=
 =?utf-8?B?NlJmMThRby84YnlvaWdIbGUxVk83Rzk1ZXFudnVDbC9RQVEyZ2NoNnN1SGJE?=
 =?utf-8?B?cU9nSW15WTgzOTRnZFlpT1NweStBTThNc24yMld4NW5MWG0wL1htZXkvWHVO?=
 =?utf-8?B?c0p5Y0xKb0VGVm85VDB0NEhyVFpqRGgzUW12cU0xdkhTMlVqdXZmdnpTdkp6?=
 =?utf-8?B?ODFCU0gwdi9hUytXbUZOWDRIQWZqTlBiVkNQZjZ0b2FrSTA0cEtMaUNJVFkz?=
 =?utf-8?B?eDRrWlgxMWhVZW5wZDZOakY5Z09GeXVZOVVCdE5sLzNEZG5menMzSFlac2Z1?=
 =?utf-8?B?cDlUcVFnQXRBTlA0TXNta2Fjd3h2T0NHMmxWTTdVUE5tVXFkU3lrM3psZUg3?=
 =?utf-8?B?NE9jellrem10TzRURWZRL3JyQitFZkwxemRzZlJtb2NYL1FRdjJGNFQ1dE9k?=
 =?utf-8?B?cDdJa2RiVVpwWGhDcmRwSjFJR1N6bTljeis1cFNrYVkwcTZCZjZtSEZsNGpm?=
 =?utf-8?B?bC96WXRaMTZlZ09DN1VqbnJNZ0R3L0dZbE4xMi9TMy8xWDBpY0ZrWlAvQzdT?=
 =?utf-8?B?dHljRkVrRGs5THJPZjlXZFVQZ3pzdkhsMUtQeDRZd1Q1SDMzcTNhbEhjbFpp?=
 =?utf-8?B?TjhzY0ZqQUd3bDhJdEJSRTlvQTFXdFF4U1ErN05nMmswdnRZZ2Z4aHJYL01B?=
 =?utf-8?B?dGJSL09ES0dwZWcyY0lLK2ZkbDhGemNqVlNVdVlVSWdueFl5c1oxUWZIckM3?=
 =?utf-8?B?NVFCWVRMby8wVC9uSGJPUmlWYTdNVnVOWUc0YmJYYnh0RUEreEhpMDJYRTd5?=
 =?utf-8?B?b0ZONFB3Z0V3amlRMFAwUDM5ZTlvQ2p0RndYTzJ3aUJPUG9oU2FTM0FXeEs3?=
 =?utf-8?Q?mIQbA/G8vHfyfJH/SNW5zMywMjwAUsbk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejFGNU1GZTRTUklNNzU2SFBhTmVYbzliMGRzRjhDSWVDdWJYUmxsM3VaUmRw?=
 =?utf-8?B?T0l4bjdPQzgwcmMva01waUFKVWJ2eXZkREpoRXFXY3VFME5DVWFmOTFyeFZ3?=
 =?utf-8?B?clJLTTNGdFFPdTRIcXZJOFpEK2c4YXpwc0d3NDBLL1pJTnRBQjJEWTVXdDFG?=
 =?utf-8?B?ODhnOTl3c05LNjBEQVZTUGtoMy84TUxCcDBQTEdxTGVZYkZTd0xSN2twa0tq?=
 =?utf-8?B?WTBXUjZVRTJ0eWJlQnBma21PV3Z2L2NuSUxLQTBIUlEzU3N6ekd4ZkJkQzlM?=
 =?utf-8?B?MFdGa2piejE5dzhjUncvaEUvTUVlZFdqWldrdThtNVdNSlN1TENZZ0hSbHBx?=
 =?utf-8?B?QUVlbjB0TldWckN5b3FEVUpLTWx2T2hxR1FVbjU0ODNBYXpiMDJnYWswbXhJ?=
 =?utf-8?B?Q0U5TWlWYWJ3cFJZMHAwakIrWTBNaTNkeWhtVGIwQ2NFZ055ZVpwa2hReG53?=
 =?utf-8?B?WDdadDM5ZVhxL3dHOGg1NldieVFyZ2ZuTExYaHJtSTNZeFgxamMxZVRCUUVX?=
 =?utf-8?B?UVNmRy9yOTQ5dk9YVGFhRDVFYlZoY09wNkdSdDE1QlVIeGxZdGU3VmZ3d1BW?=
 =?utf-8?B?eXVtdjB2c3k0YzN4OFI3VHhqWTV0QXVYUjd5UXV0bjZZTkEzTlFOWEVQaUlB?=
 =?utf-8?B?Y0ZEL1FkMlkwbDVzbndWMFlGZjdOQnU2MHQybTBJcERYWWtzeXRsTDZKN0tt?=
 =?utf-8?B?aHZFa1NqRG1VSG9haXl0ZnVXS0x3OVZRVW0wckczSG1aWGw2aEkxRCtjYXJq?=
 =?utf-8?B?VDhKTWswc1Z2S01mUXJRS2cyQlB0T0d4SlBUV21HU3NGc0NEOHl2NzE2VHh5?=
 =?utf-8?B?VU14QmRCbjg5OFlkQnNDeXpFTW93amFseTBWajc5WjVGNE12VEpsajNuQ0RJ?=
 =?utf-8?B?WTFkc1N0Y2laQnFicGQ5a3Nwa0hNUThjZ3E3eEpBazBWVy82NHdlalZqektn?=
 =?utf-8?B?T3MreFFiU1ZvUlgvL2J3bE5NdStpL25rR2x0Y2R4TDFCdnMyNGkrRXBseFlT?=
 =?utf-8?B?cWJxL1FPQlJVd1dDQ2h3d3NEMlJLSnNMckhtM3NMRlNubkNiNmFzR2ZuR0dQ?=
 =?utf-8?B?bGJrQldXd1d6bUt2OXlwbkFDOFluVUV0WlZ0cXdqeXZsZWN1Y0g0d1FYNHlO?=
 =?utf-8?B?SGxnaU03NURJSVBEaUZMWEZ1WlY5SXJsUVNuZ3hOb244SHFmYTRnNEFnTlhx?=
 =?utf-8?B?eVAyK3pNUDBxNmF3eFdHTFNZWTgzWDZuMURuS0pZMFpiOXVyYWtYQWNscVEy?=
 =?utf-8?B?dHIzNjRNb1hreU5YbGhQZ2E3NFVFWEVGb05KVXVCMEU3T3lSRTdydG5FS25P?=
 =?utf-8?B?clRBT0ZiL0d6TTdSRmdEbUNPRXhLNFNiYXkrWDNYMldITEh1aHBsNW1XNVJ4?=
 =?utf-8?B?UjU1TTBnYjdybTcxK1ZjNlhpZ3pXSmpwQjZzcStpbW5MczQ2bGE0cEQ4dSs1?=
 =?utf-8?B?OXJZSzZnV0k4UHRvVGNVbm5VaUpKenhBYlN1dXM2S1FOUkdleG4xT3E0N0FV?=
 =?utf-8?B?aWJKM213ZUVwQm1BWVJRSFgwOVAwLzY4RmoxS25FRmNHcDRIQ21OR1JFeVRh?=
 =?utf-8?B?RjA1cFRjdVRUYUdMQ0JKcVVmRWxTd1dHMTNycnd2WURodXNPL1hmbUlNQ01S?=
 =?utf-8?B?TmV3WTNDR0NQWWU0ODdBbThZcGI0VUNmUzBFUUo3elJTRVJZZ3FGcE04THlB?=
 =?utf-8?B?M3RQblZ4b2MrQkdTVHV5Q21CRkUzTE9uMUpiRHc1WkhuUGxWQi9iYkRxTDkx?=
 =?utf-8?B?SDlZTndVRTFuZlo3R1Fzb3RKSkViMzBWT3dybVhuWEdFc0tJejNxYzhoTGNL?=
 =?utf-8?B?czZ0SG02QStpNlZyWUVKZjNQSEY3ZlVhUEtNVk1mdHNUdFpDTmlMTUIwSFFZ?=
 =?utf-8?B?RXQvUFpjRWRzd1NTb0ZXei9yTW9QWFBOZlFjR3N1cnVpeHA2QWNubFNHZnVY?=
 =?utf-8?B?ZnNpRFQxOWQvdXlHczZUSEpIR21NUzlSQ1FnUUlxYzVzclR5NHJaNjdLQ3Vp?=
 =?utf-8?B?MnhPY2cvd3M3bVkyWmtnTGE1R2ZTb21UeGlEbDdWN3AvRVNodWpUZzZ3RmNz?=
 =?utf-8?B?ellER1hzbmkyVU5CKzJwZkVLR1FCWFZ1Z3UvanNtbEl2RmJVeVF5N3FPeHYx?=
 =?utf-8?Q?y8SBs7v88mIWWFxbHuBdDT/07?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r477qoEdf7o8WsfNKjrObxhpopDcOoRV3DsSjGuOzqPly0bh2HC091ErQ4kcV1bgR+hWb2jvDauzjiDPehlLoKGrf18esGjSIIerlIqxHP5/QwgT+hvqgExbLEGj45WHfav93Jfo1AFd/AyRYtGmz2POucTrgT63LYnKoKHn1SkSG/fwQNxx/FLkiG2rxH98MfxkKxftVoGuLuNqNhGi608vlcQdmUWk98GTW/eUGCp04mAtBB2TRjBFdOYFYCB1lolbZfCfQUxalo5dxkNvIZjSA4xCKRzncuzcZjHWD1HqRZBpmd62yrykpK4sTXt5LOhKJoKKYtxS+WsPLeT9qjR4ENgK5QXgN2pGwaaCndz8wgTXs43cCitwdbB3HoPY1LJsBXAyfBLufCdDa4PzzIFXTSDJtgag4Vj0T5vVJcQiOkCXy5zAedJDRKrXtXLjPr0v6tfyHUMhY8X4BNh5Yen/FPzP2LtpHo8XINW9aQWTjJXjW25DrMK1XSC+NwzCqjeB4Grm5IehnvBmHJ2WoCwxnGk2pVwrubXz5tns86It0aCZVG+hYrb6ZIM5lAZ/f1GOcqN9ZCAaZLRt/xQ5k5demnIElJdOLe3+xg2H/nE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5fb2fb1-c252-4103-938a-08de3e7ffdb5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 21:54:17.2699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEf4VWcGqKVV4hbpY09Bt/6ZJnjIOWnbusonfBysRZXf9czanNhF6OgU54rzOhEAQF9spRCziu6GX69apBsX3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7129
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512180182
X-Authority-Analysis: v=2.4 cv=WZgBqkhX c=1 sm=1 tr=0 ts=6944781a cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=jDKzLKsKLRaa6grjij0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: aKiGAyzhclLinapTlsbhucm4qH7BoHwq
X-Proofpoint-GUID: aKiGAyzhclLinapTlsbhucm4qH7BoHwq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE4MiBTYWx0ZWRfX7XFkcqj4/sKu
 MX/9k/FV29XRIa8n3DW1gLw3qNGGtcG+Zp0Z+cc+SgxZ3wl+lQtNrY9sIHxsJwrapbi/dixiww7
 67VAGig/bIa2T9lWbPybrfWiTPRsrT+h/3y3PU6Ph9oB7RvbmiMZfzTsAkIxeep/bc1jeviv3F0
 DZIY/baLF50QVnQlVBao+KSM5ucdfC3OlAZdrwwIaseWLQkM6l3md/u0fgR2j70gHDWbuF3HhjQ
 Nen0jRJgdVAzkN3LAceoXj/AyVZ0W/hugaITHGK0qDW5rh15QMXMPgjo8QXf275Zrn6L/BkADOT
 k+xLt4FeiwTRYBWabsX8THHSr+BETLvxXy2hl2FdPsScPNhEUJRyxhgBZx18rDetz22Woe4xaua
 FiBmoqnGGej5Au2zYk3G3l28Y0Oycu5CQHxkp0sC3kvJBnNGxmu7Z+raWHh12aNop1z92CzQ+Ji
 27hcvIJ5mY1lTaHVq9Q==

On 12/18/25 15:17, Kris Van Hees wrote:

> On Thu, Dec 18, 2025 at 03:07:29PM -0500, Eugene Loh wrote:
>> I'd like some context here.  Why are these permissions being changed?  E.g.,
>>
>> * There are some *.d files that start with "#!" but they're invoked as D
>> scripts, not interpreter files.  So, they don't need +x.
> Well, yes, they do not need +x but then they ALSO do not need the shebang.
> (See below)

Sure.

>> * There are some *.r files given +x.  Why?  They aren't being executed, are
>> they?
> Some tests (I believe some you wrote, actually) generate a shell script, with
> shebang, and expect it to be compared to a .r file.  I presume that the intent
> is that such files are expected to be executed, and therefore they should bear
> the x permission.  If they are not expected to be executed, then I think it is
> best that the test does not generate a shebang shell script at all.

I'm familiar with the practice, but I'm pretty sure I didn't write any 
of those tests.  The original intent is fine, I suppose, but I do not 
think we're executing those files anymore.  So, rewriting those tests... 
fine, I suppose, but wouldn't seem to be all that urgent.

>> * A D script is turned -x.  Okay, but not consequential?
> I agree that some of the file permission changes may not be correct - I did
> it semi-automatically based on shebang presence when in reality a lot of those
> trsts probably should not have the shebang.  I can go through the list and do
> a more thorough job at this.  I admit this was primarily to get lintian to
> stop complaining.  It is very usrful to flag potential issues, but the fix I
> did for various cases certainly may not be the ideal one.
>
>> I'm not against the patch.  I just don't understand it.  There's more to x
>> permissions than whether there is a leading shebang.
> I agree - when I included this patch in the series I forgot I had not done a
> full review of the changes to determine whether they were the best course of
> action for each case.  As mentioned above, shebang on D scripts that are passed
> to dtrace is pointless and should be removed.  Except perhaps for having one
> test that ensures that shebang presence doesn't cause dtrace to choke.  That
> can be a singular exception.

Another issue is that runtest.sh *does* run some D scripts as 
interpreter files.  The key is that the shebang line is #!dtrace... we 
only want #!/usr/sbin/dtrace for --use-installed.  Interestingly (well, 
this *is* something I think I did!), +x is not needed to instruct 
runtest.sh to run the test as an interpreter file...  we copy the file 
and then fix the shebang for the appropriate dtrace path and chmod +x at 
that time.  (Of course, there are other ways of handling this.)

lint checks are good, but it seems that maybe this patch in its present 
form is not what we're looking for???  And I'm thinking the urgency is 
low enough that it makes sense to postpone this sort of clean-up work?

>> On 12/17/25 00:09, Kris Van Hees wrote:
>>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>>> ---
>>>    test/demo/script/interp.d                                         | 0
>>>    test/demo/script/tracewrite.d                                     | 0
>>>    test/demo/spec/specopen.d                                         | 0
>>>    test/stress/fbtsafety/tst.vahole.d                                | 0
>>>    test/unittest/funcs/substr/tst.substr.r                           | 0
>>>    test/unittest/funcs/tst.basename.r                                | 0
>>>    test/unittest/funcs/tst.index.r                                   | 0
>>>    test/unittest/lockstat/tst.lockstat-summary.d                     | 0
>>>    test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d           | 0
>>>    test/unittest/scripting/err.D_OP_LVAL.rdonly.d                    | 0
>>>    test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d              | 0
>>>    test/unittest/scripting/err.D_SYNTAX.concat.d                     | 0
>>>    test/unittest/scripting/err.D_SYNTAX.desc.d                       | 0
>>>    test/unittest/scripting/err.D_SYNTAX.inval.d                      | 0
>>>    test/unittest/scripting/err.D_SYNTAX.pid.d                        | 0
>>>    test/unittest/scripting/tst.arg0.d                                | 0
>>>    test/unittest/scripting/tst.assign.d                              | 0
>>>    test/unittest/scripting/tst.basic.d                               | 0
>>>    test/unittest/scripting/tst.pgid.d                                | 0
>>>    test/unittest/scripting/tst.pid.d                                 | 0
>>>    test/unittest/scripting/tst.sid.d                                 | 0
>>>    test/unittest/scripting/tst.trace.d                               | 0
>>>    .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d | 0
>>>    test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d     | 0
>>>    test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d   | 0
>>>    .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d | 0
>>>    test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d     | 0
>>>    test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d     | 0
>>>    test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d      | 0
>>>    29 files changed, 0 insertions(+), 0 deletions(-)
>>>    mode change 100644 => 100755 test/demo/script/interp.d
>>>    mode change 100644 => 100755 test/demo/script/tracewrite.d
>>>    mode change 100644 => 100755 test/demo/spec/specopen.d
>>>    mode change 100644 => 100755 test/stress/fbtsafety/tst.vahole.d
>>>    mode change 100644 => 100755 test/unittest/funcs/substr/tst.substr.r
>>>    mode change 100644 => 100755 test/unittest/funcs/tst.basename.r
>>>    mode change 100644 => 100755 test/unittest/funcs/tst.index.r
>>>    mode change 100755 => 100644 test/unittest/lockstat/tst.lockstat-summary.d
>>>    mode change 100644 => 100755 test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
>>>    mode change 100644 => 100755 test/unittest/scripting/err.D_OP_LVAL.rdonly.d
>>>    mode change 100644 => 100755 test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
>>>    mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.concat.d
>>>    mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.desc.d
>>>    mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.inval.d
>>>    mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.pid.d
>>>    mode change 100644 => 100755 test/unittest/scripting/tst.arg0.d
>>>    mode change 100644 => 100755 test/unittest/scripting/tst.assign.d
>>>    mode change 100644 => 100755 test/unittest/scripting/tst.basic.d
>>>    mode change 100644 => 100755 test/unittest/scripting/tst.pgid.d
>>>    mode change 100644 => 100755 test/unittest/scripting/tst.pid.d
>>>    mode change 100644 => 100755 test/unittest/scripting/tst.sid.d
>>>    mode change 100644 => 100755 test/unittest/scripting/tst.trace.d
>>>    mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
>>>    mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
>>>    mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
>>>    mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
>>>    mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
>>>    mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
>>>    mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
>>>
>>> diff --git a/test/demo/script/interp.d b/test/demo/script/interp.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/demo/script/tracewrite.d b/test/demo/script/tracewrite.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/stress/fbtsafety/tst.vahole.d b/test/stress/fbtsafety/tst.vahole.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/funcs/substr/tst.substr.r b/test/unittest/funcs/substr/tst.substr.r
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/funcs/tst.basename.r b/test/unittest/funcs/tst.basename.r
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/funcs/tst.index.r b/test/unittest/funcs/tst.index.r
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/lockstat/tst.lockstat-summary.d b/test/unittest/lockstat/tst.lockstat-summary.d
>>> old mode 100755
>>> new mode 100644
>>> diff --git a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/scripting/err.D_SYNTAX.concat.d b/test/unittest/scripting/err.D_SYNTAX.concat.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/scripting/err.D_SYNTAX.desc.d b/test/unittest/scripting/err.D_SYNTAX.desc.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/scripting/err.D_SYNTAX.inval.d b/test/unittest/scripting/err.D_SYNTAX.inval.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/scripting/err.D_SYNTAX.pid.d b/test/unittest/scripting/err.D_SYNTAX.pid.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/scripting/tst.arg0.d b/test/unittest/scripting/tst.arg0.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/scripting/tst.assign.d b/test/unittest/scripting/tst.assign.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/scripting/tst.basic.d b/test/unittest/scripting/tst.basic.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/scripting/tst.pgid.d b/test/unittest/scripting/tst.pgid.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/scripting/tst.pid.d b/test/unittest/scripting/tst.pid.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/scripting/tst.sid.d b/test/unittest/scripting/tst.sid.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/scripting/tst.trace.d b/test/unittest/scripting/tst.trace.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
>>> old mode 100644
>>> new mode 100755
>>> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
>>> old mode 100644
>>> new mode 100755
