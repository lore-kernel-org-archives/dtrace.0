Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F41533D503
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 19:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768937091; cv=fail; b=j+qUZ/FRIiS/PXkTmNXLXDCQNGqkq3VCqnQoKrJ1JsIMs43168z7TSzLSL9vf4X4SK3hGSEKTDF5ZyImGk2qv8gmmTvCZneNxv2Q1MpukSPw+jQp269WXv/6QYnhyWi5aRqsa/QER/OvzmuQK4T9aH9XBc1/HFZ6ngewVSJLE2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768937091; c=relaxed/simple;
	bh=HsnoQczpI8OmO66qnjVFLnN2IwbR0rOTY+L4cVwTecY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nfar1EFwam6ouZ/lEF51EbMY8I9+zoEv4NxxpNaFiQY2DIAey3YWx3HVd0ZvsvDKvmhqWuLaoA83iCJZiuacXOyYPQg9oUU8h3fPus47H1bAFxUt8X7gkj6rmmKCzz+HxhjUrofvhgozLKnDb+v7oSBelFGS6VuIuBz1GOze2Lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NyiqwkXn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KLgMbbsA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NyiqwkXn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KLgMbbsA"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KIV7os3031586
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 19:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=sM0bogkpuriX0VfCmGNsA2Q1PQ0FQbBrzk5iezIdx98=; b=
	NyiqwkXn22jvcWEBaGOlqH7ltFiX5auPS269+HFYpQRxO3wcmQaRKDW45qmVcbi5
	toVn0iE9wGKQuZqWqQ7Kxb2BMIniV3T8lGZxSHkN+0q4COlsUNd0uXULXQhT7tVE
	5Xp2BxJINOWb/GGvhSLiBLomiAhkrzRM/5eafEi9Pj1hmqnsMGf4Hh435oPJRcQR
	8ZQE8wmMURZgsFgGlODiSnlOeExJha9sZDMcQf4C9IdluAqkuceNNCJBuFeI+oJi
	ugma4CEO8ZUU6ZV/RZbmLUQFhE0MUnCV5F4pdTlbXRUJWOiidAvxmeGgN3oKlJd8
	f2fSHblgOHZRokvmr77tEw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br2ypv7ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 19:24:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60KJK9k7019000
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 19:24:47 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011047.outbound.protection.outlook.com [52.101.52.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bsyrqxrjt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 19:24:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UiQswUdwNgiLv782aJRqkr36uISJJOhZ+YuPcreQCUDDegpYqCN4GkChHIrWqscW2mameaMuTYeyjK52XemnuQAENOpUCQsIRE6P6DdKxzBVJSEypXQyb4TRwoFmfkHNwmxfAqU7zmsagtnP/VwVXv/fa7Re4oRMD1FAHWK3JH7PPxiRorI+t0IuF/WgbPOuSYhxgyWrzVMOQ1KnqNj2Q5dIpZF+6cKZhuac1mm+gh5UEF23FCrqVgKpQD5qKA8nYEfmq/13mc+J4RhqICZcN60cU3+1l5n7dCeALwdqs/t7OjlIZ+6l2FHGpX3+hr4Wc3uUT4dcrvCPGRyI+oWpHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sM0bogkpuriX0VfCmGNsA2Q1PQ0FQbBrzk5iezIdx98=;
 b=wkp5bMZUW3jimZ3M3HvMppuSxIIo+sXJYEzDxmMKUdzByqUOk+XI0a1sGOdJ0kw6h0xgLQgLCwtZ2MksIrgFCLmneesJFo/cw49T9e/OmESBZ5E3mcseCfDXOcy/wUgrB8BiEZCvncQ2VVeUjSh0qYD2Rmv8x3At8yaqM2XuFcysgNeynJXRNx02cv3zD/2UeqO6CrkbWVR3QVg/ljHLoEiWeblGUVy2Y/bjegXExubt8BVpulDHUFzQfKZS6e1bqOR0NCJb/X9ARYzhRGy3WCXR0JfzIOImkPHHtqFz6bbkjvk+fWdfjMyOHDpq8R3Wvoi9w/u04EyXMZI+iqMY3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sM0bogkpuriX0VfCmGNsA2Q1PQ0FQbBrzk5iezIdx98=;
 b=KLgMbbsAn5fLReIkcWb/H2k/2DbIb8GmE9fdqcowR+BmN3EsuJuC1HsRoVjmuvKILguwMH39A/xMapFpxbjSy/PLD7NXbXeivDin6/c2JniMRnkXLLoLi6PnKhVqyyfljHt5+a0Y9vu5rrSCyHh5sd8MglE67nfsAsB61hLNRKE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB5582.namprd10.prod.outlook.com (2603:10b6:a03:3db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 19:24:44 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 19:24:44 +0000
Message-ID: <08f076e7-9573-7ca7-f89a-a3fd33bf683c@oracle.com>
Date: Tue, 20 Jan 2026 14:24:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2] dtprobed: use /proc/$pid/map_files, not
 the filename of the mapping
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>, dtrace-devel@oss.oracle.com,
        dtrace@lists.linux.dev
References: <20251202230453.124306-1-nick.alcock@oracle.com>
 <20260120162051.183028-1-nick.alcock@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20260120162051.183028-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0051.namprd17.prod.outlook.com
 (2603:10b6:a03:167::28) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB5582:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ba00cc-3d0a-4d73-1a0c-08de585990fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2E0TmIzbmxBQXRPcGQ3dldZOVp1MnJ1bHJiaUFCUTRUc0t0Si9xZ28zK1A2?=
 =?utf-8?B?RVFZZjJidGkrUlZkelZLditXcWFmQnQ0Mll2Mkw5VWs0eDYvRkhPVmxkcEx6?=
 =?utf-8?B?dTM5K3FZaFg3VHc3aW4zOUZrUDRkTWVnLzg5VnBwMnRXckw0UTdONE43QkRW?=
 =?utf-8?B?ZXRhWUozenJTT0wwVXdxWGwrZDF6Z3hmbUUrWjMwb1BDKzZhWUF6ZjZidk9H?=
 =?utf-8?B?akUzUlB5OEhjeDduNEN4VXBENWhxM0tpN0JGQk5EK3dNaDlMRU9wUVo1NkhZ?=
 =?utf-8?B?Y0U1cmtxbDQ1bTl6ZXA2bDNxblZxK3MvYm5qdnlvQk1RRWpRb1U0d1A0UWt2?=
 =?utf-8?B?NnN0bDEyT3ZCOHpOL0VaWVlDVTlvc1F4dG9xNnR3QkUrbEVTOHNkaG5BSHJQ?=
 =?utf-8?B?aFFOS3A1VCtjenVRM3JKSFlnSlhNRUlnRFJhL0wzcVBNbXNYdCtCVU1idHlt?=
 =?utf-8?B?cHNVeWE3cTFTZ3JCR1MrNnlONjZmcUhCM2JHVjhiVVdNNnl1UXNqdzAzRGlO?=
 =?utf-8?B?Y3YydGE4Z2RVQUVvVXVIeUQ2NUU0YUY5d2s1a0NDVDE4WEZ2VjdnVVl4WmZm?=
 =?utf-8?B?SWJaS0Y1WHZJN3o5cVhWZGJWbWhhTEpKNGx4QnpsSDNZVEdxS0M5ME9MQzA4?=
 =?utf-8?B?d214MXdFSXBmd285MDQ0Z1FnV0NsNHlud1lzRE5zcjN5WlBGaVlpdXQvNWpI?=
 =?utf-8?B?UGxJL3FmQVMzbXVndEVSOU15S1hXWnNBSm1MTWlRVnZldW9YbENRNkVHUnIy?=
 =?utf-8?B?SlBkalNsVEt4aU0rcE5BbUZoMWI3RnB3MHFyOHNGekltTFFHd1NYT0JHdWhl?=
 =?utf-8?B?WEJTM1Via2JGb3I3RzA3YUZiVnFBbVdGbGowMXNDd2dXeTcwTm1jVWhlSi9N?=
 =?utf-8?B?UEtGb3UzeUJxVFhlMFQzSmd2NlBiM1VMSkJTbmFDREg3c1pxQmx2bk9nVFQ4?=
 =?utf-8?B?V1RUTFU4aFRLaVpFb09mR1BDcjcxSVp2cU1jMFB2QndmMmlKR0t5cEhVRWZU?=
 =?utf-8?B?Nkh0NmJuWnlNM284K2RNUGZSd0xCTkdQODNpbWVSdCt6c2tnbE9INlBCbXBj?=
 =?utf-8?B?QW5YcS8rbHM1d3NxY2pxMHRKdGJra3hYaXZMVFJpdy94YVk3a21HOElyUFo1?=
 =?utf-8?B?VFpGY29uOHd6MXJnb0huTzg3YXROM1NDOGtCd01uRG43NVBKTE5jVDBHRGN0?=
 =?utf-8?B?bjUzMy9NWm1IbHZLcFRCUE1MRnhZUHpLVDVPYlBRd2NYL21maks3QmxhNlRz?=
 =?utf-8?B?c2ZZYmJEY0pRRytkMVh4aWVyNHg3MzNJY2RrYmNlbjhjQk1nMDJwRkgxOThz?=
 =?utf-8?B?VkNzSE9obnNBTndhdXh6L0hncUNUQkpEZ1Joa3RIRmFzNUNJZklCTVc5bDVK?=
 =?utf-8?B?Y3phWndsZEJxSlNPekN3SHhycXVzSG9pOTJkdHdNVjE3aVMybk9IK1k3VGpn?=
 =?utf-8?B?MnJUNzhueWRzSHFvbTMySS91MlBOdWYxZ2VKQW5oQXNxQlJOVjBraXBTdGxR?=
 =?utf-8?B?N013UlFnK2owK05ac0hDYzg1SEFEMVZ2UExsRnEzUE1Bc1JNY0poNUlJT21r?=
 =?utf-8?B?NEVWb0s0UVAwbEJSTmNhL1UzakErVDJONGdhWjFJMGViS0FSbm83aGFKSzY0?=
 =?utf-8?B?OE5LQklRUlZpcVE2OC9GcEJxdHg3VThVWHNmN240a0lVSFR2cWcyZEdTbkZQ?=
 =?utf-8?B?SUk2RnY2Zk51YXlpTUtEMEcrZEhZZldjZ1Z4amRaUEpaQ1hvRTMrSGVEbzhC?=
 =?utf-8?B?Q3RacFZMN1h6NHBhdENSaHhkNFJhaUZhWmhsWGVRSkZvaEpiNHBNa25FVWNN?=
 =?utf-8?B?bGx6bStYTk9LWXRDMlVYTURaRFM2ZDQ0R0pVdjZmbGo1SjVvcE1MSFJ4YUdR?=
 =?utf-8?B?c0pxSFVOdVhuRVc1am0vdDNDQ2tlRk5GUnBoTTJUMUcvNnVOVzB2R2JDcVJ2?=
 =?utf-8?B?ZlFTalZZWk1XcERKWVA5cFM4RW5FR2ZxTEdXVnJDUy9NN0lkalZjVFI2WmNy?=
 =?utf-8?B?Y2xqcjQ0YXJwUk5hLzIyWHlnYy9xMmZHbnB1YVMxK3grY00zYVhqQVZQOUlW?=
 =?utf-8?B?bFg2QVNZMXFRUTZHUERXTTd3bzhZS1lGM2hmcUtqbHpob0ptMlU3ZEVWMk5D?=
 =?utf-8?Q?6bWw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHB4MmtLWmxXdThHMFBST2R3WDd5MnhFSGpsdGFiY1ppZHdpN0xxbFd1Mnp5?=
 =?utf-8?B?STdyTTQxUTZnS3NjNk1IV3duODVyaTFXaDNPWVJGdGhXNTdKUlptVmtYUTFE?=
 =?utf-8?B?RlFvNnAwUy9EdS9VaEVJV2M2clpJUmRQSFR5L3orVEVPdUdLWG1JUWR6TzdU?=
 =?utf-8?B?STBNTnJGY0c2MnVSVDg5NUtzUDc3TTM2MmhtcEQ5aTgxVW5BNG0yOXJxdDlP?=
 =?utf-8?B?czArU3pjKzJZam9hQjdZNkdUbS84VkkrRGVmb2wzY2hIZk1lTFdjNTQzaEN3?=
 =?utf-8?B?R3VaQmwyZTBPVFlTcE5Oc1BaeHVoWHBHVGhpWHFpSU10dXBzSytxZTFHZ296?=
 =?utf-8?B?V09sN3pKTEMxTXN6Z0FnQnN6NWNSWFE3QWZhMjM4c1Z5K2RvTENmVjZKVDJZ?=
 =?utf-8?B?YjN0RVBpdUdNM2NHaFBLYlNEdTZZZXcwam9MUDlqVTVJa0UzWVpjV2xTMmtS?=
 =?utf-8?B?VFVlZS9Edmx0b05DK2dqTUpZdFUwK2Z6ZkpmSExYdHVtMy9GaEJudkUvWHRO?=
 =?utf-8?B?a1BTbkIvNWZaQUxxbmhhZ3FZd2ZabTdVS2E4MTdPanNCTThFR0l6TVlEMkl2?=
 =?utf-8?B?NHc0K2xXcHNLT3lhazNObjFBRTlyblEzUzVsU2ZzVTJsQVhvcmNpY0FQc3RY?=
 =?utf-8?B?Mlo4ZStVaWs5cUZYZ25IcUdOMFpMZ0pCZ3pEa29JWEhBOWsxNGtHbUxiV3Q3?=
 =?utf-8?B?SGRIR0hlTWxOeFR4L3B6aWl6ekh6RXRUTE9od2pOT29QSTBhYlBxY2xReUJw?=
 =?utf-8?B?N2VZMUZkdHV3K1Q4Yy9VL0NIanYwWmZINHFRUzhwTVZqMTFqenB1NXNRSTlR?=
 =?utf-8?B?Mi9xRTd0ODdMcjZpYU5HcjV0TW5kR0VwRFVwaUVvNkdkbXYweHgxZHB3QlVB?=
 =?utf-8?B?MnpVRmdaeHV6ZEFzbVA4V05keGdhL0JuMVg5Y2FQZTl0R2o1MDdCL3lDQWox?=
 =?utf-8?B?cXFhR2VRVDluc2c2RVFhdm1tTEN4YVlqNEprVUVibFBacytNRFd6L29xQkNu?=
 =?utf-8?B?aC9WTEpVTEZjVENhb0UzQk9yMUlWZzhkcm9WbWU3U2VJVlY4SHpsQ3M2VXZO?=
 =?utf-8?B?VFNmT21oZ2FodE5UVWlqZU5LSWh3TTlLcUgyWGUzZHpGcHMydWhRcWVISytm?=
 =?utf-8?B?cktMWHhKVE9Wdjg3aWxsQ0o0OUpycnowSG1vL3hQSDE2Ny9YOFovblkxOFc2?=
 =?utf-8?B?ZXhzRXh6WUQxcC9RZUUvaXV3MFZQUkkrcjV0ZzFFVllxeXMyN0NqTzg1RnB4?=
 =?utf-8?B?cDF5RmZ1UVZTcXpld1c2WXNsTzdNUU9qclN0cGpGR2podlZsWUk2Y1p1ZVlP?=
 =?utf-8?B?R09ZWXR0ZjY5Y3d5bER5eHNGRGJ4dFFxbHNtVDVMZVJTb2RrUkJXa2lsc1NH?=
 =?utf-8?B?TjRwdVVUYWs5QXV0cFYyNHIyc3p1bmM1ZTBrSFVyQjc1aG4rMXhvVXlna0lK?=
 =?utf-8?B?NFJucjhBQkwwMWhWRFZVU2VidWsxR2hVMXE2UjRaendXbURWVzc0dzBKRnlI?=
 =?utf-8?B?T1VmbEV6TFN6MDNZWjQzeVhKTFNkdFcrbzN0Ti9vN3hLVmlhd0FoUFFGcEZa?=
 =?utf-8?B?VkZPbFNWZGtETEQwUXNhbWFWall6SGVWck1WZVpvRy9rZERMS3Vvdjg5V2cr?=
 =?utf-8?B?WGNvMWU4NlZPYTdGakNRRnVnKzZBMExZRXU2Z2U5dVphWmQ1Vm94Yk9BQTNN?=
 =?utf-8?B?WUs0MGxNK2VDblVFejcxWjBUMVdualpNNElDOUJ4Zkl6ZVY5NmlESW5NdmxH?=
 =?utf-8?B?ZjUyblE3R2wwWHcyTm5mUDZPc1lVS2ZYT0x1c3VGTlhkdkc2b2FVcURWTzZK?=
 =?utf-8?B?bW0wY2M4YWZqaUtKLzc4RExvQ3ZkOUpQYnh3aFpjMmFwMUJoMGYxQWUvT1VZ?=
 =?utf-8?B?NnIwSXRqS2RKRGw2ak9ZV0RlTUtmbnVYMG9ZNys5VS91NHQ0L1NhOU53dWl1?=
 =?utf-8?B?Zmt4UmprZzE3bzJ2Y1Vsb0dDTlI4ZkVwcWlkelh6ZFFiK0Q2bUh1L2lEUVYv?=
 =?utf-8?B?Mm1Rd2loRWl5Y0ZTNWEwSDZJTXZ1M2NHbDlydmFmSkhDTE1iMW9DM053NnNw?=
 =?utf-8?B?ZitBUDdFT3ZudlpsOEEyNzhxc0tTcW1FRlVlRmdNdlg3MFNxTGNBTVMxUUox?=
 =?utf-8?B?c1N6dFhpaDNqZzFrNEhabVFKRXRUSElhUnpHTHA1NDlTemlZMEVqelppa1J4?=
 =?utf-8?B?VGJISmJlTTJqVXcwR2dPWncxRlo4ZSs0dlc5Skt2UmxiampqQTE2bGkvbjlV?=
 =?utf-8?B?OGpCYkFEUWJwYmZrTDczdkI2WnpBbUs5ZVZycTZ4cS94ZjFsTUZyeHZkS2cv?=
 =?utf-8?B?Vkx2N0djL1FYdWE4aDZvSTZ3VTc1UUU1Ykt0QXhGTzN3RTRNdTI0QT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cZ4rrAixW0e+XtFwW0o30Ho7cXl1XvfzxSvjcaWhWMKGODgXEp3x7UFVJtLyaDrmbEJ/kzjSqMAQuXgxs1FdfVL2j6ijNX7CkSv2eWMa3mbyKtCwhARYkgW3u9fMvl1YaF9G6uJ2YC6GvCRWM4xDoJODceIer03q8GLl2V0QpverJwcxI9YjkaDwxjDfCD01IdFJ9ITmLZZa0rgalTzjGL/20I9m+Jc6sf6FCPXMnsnyDP6WJoL3AeIZoa/TtacR6xhO871TABJHOYqXTimpETI0XpzEd40L76cHV3wFl/uspwSPe+XXAalbRy56o7E1lxfeqk2OFNxgAYWbUreQ+5S0U0/KRoXKs5tv7YxztVEJwwGb1G4jZS+YO893LQsSyeTM48qJIYFsn5dy8XZmeVi4pUcc60Jj8xkKpbS2Vr8IcB4RBTduPsW9ZoRAyefOJM9jGKdJGTz+jS5KleY07AvakAiUf1yOdz0zZDrbi2JlPR8FtYYLh+uZuWDEoL23dEuwtomtvh2c2/ASc0ix6jzW+Z2X9aLTn6lnIbULc62uWfKAcg/WUjQvAg4VOfUtAwm6AaXW6+5CWkZkGdVDuSaRt7U31JfAAwtH7/oyem0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ba00cc-3d0a-4d73-1a0c-08de585990fb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 19:24:44.4646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LD8slpXKWDf1Gap6h7WByAljZMIBYj9a8MMHwCGwwJ2Yi52zyQod5fCc9Q7qXZ29gKYs2QDr/thhCF/zGs3Xig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5582
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601200162
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE2MiBTYWx0ZWRfXyDC8oq7lUrFL
 k4LEwRJJ4BjrZBX8WfUWAEautd5/lXNK2VZJ6EVBq5mqKrJPhm5p5JLhvrvNSO3dEjozZtmJFSH
 6G1HCcaj+uEPziB8QwRApqGiEmeXFLB0rQU4PvAKCZ8YQRT933+4TxnUUxGNcBWVkhhdM1iMTKB
 NYkYpmgxjzM3aHeL+WyNcL/fnbMveG9CCXDagScsjsjSBIFFTtmzMMNWx7PQjo8QtE1zHAt5aWe
 xPd4+Ixlco76PPw51c79ecVMWe8Fp04NGOXuyRZ0TbiONNhuF6tI2izVmj6p+Rn5ipt6eV9LXzn
 EVUEHTFrBybxSe7Fv0XrkNxS76L0PqjYYl0K0VpBAMOvyxkkYyMzXWnZ081247EZez23ZxJrlRo
 atUMlMcU0J5mpMLUZURzonrOlIR5onY9k2WD3D5gWFLQlEdtkN1b6Z4kL4sI0VGYdoGtxMcTzA0
 1ic5DiFxaG9VDHJPbnDhBqEgloD3VOnNQDKH23fI=
X-Authority-Analysis: v=2.4 cv=de6NHHXe c=1 sm=1 tr=0 ts=696fd680 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=TTDt0G-pAKRQ6LEzKJoA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12110
X-Proofpoint-ORIG-GUID: utjU5qLGDi3WnJdf5nGFV9YbHYbIzP0V
X-Proofpoint-GUID: utjU5qLGDi3WnJdf5nGFV9YbHYbIzP0V

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 1/20/26 11:20, Nick Alcock via DTrace-devel wrote:
> Instead of using prf->prf_mapname (which resolves to the mapped file's
> target), use Pmap_mapfile_name() to get the actual
> /proc/$pid/map_files/* path.  These magic symlinks can be opened even
> when their corresponding files are deleted or in an inaccessible
> filesystem namespace, ensuring we can read the mapping contents
> reliably.  DTrace already does this to read mappings during USDT probe
> lookup.
>
> Fixes issues with probes in paths like /home when dtprobed
> is sandboxed by systemd.
>
> Tested on both systemd and non-systemd (non-jailed) systems, with USDT
> programs running out of /tmp, /usr/local and /home.
>
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>   dtprobed/dtprobed.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index a808586559d96..9a6928055cd13 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -487,7 +487,7 @@ handle_usdt_notes(pid_t pid, uintptr_t addr)
>   		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
>   			 pid);
>   		goto out;
> -	} else if ((fn = prf->prf_mapname) == NULL) {
> +	} else if ((fn = Pmap_mapfile_name(P, mapp)) == NULL) {
>   		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapname (process dead?)\n",
>   			 pid);
>   		goto out;
>
> base-commit: 6e94c7d0a253806f85c39ff5f4e32a800d4cb6b6
