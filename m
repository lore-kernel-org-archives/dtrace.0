Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7B735BDBC
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 21:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768424993; cv=fail; b=ehlRYbYqIFndY6wad5qYjRDdP2rwfRSOYGM3K7gGxAqzBQWQ6iTdJCiSLDQNH+nk+516ELKjFJCfLi8Jz7hcWU5m4SxgXB7rPUk2b0RqSMCs95soCiBdJt16221SYjBgjtOaurazph93oaL+q5ai5fGMEBJZQa3dErRoJDZ0pe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768424993; c=relaxed/simple;
	bh=reXAvhKw+PDnuTTBuzKp9Rw0WSWtXfLYQMPOTxdzdlA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kMAomKdFkpuWm6iqMvWQjQ2rtFFTuZINfiqB7KPni49IpXVwUHkoVE8t14gBT4eN5aemoe3zAPfQe7DjKM4AmsGFbe1JXpL0qQ+IOKxO6dNrTB7H0b0v/iJOPpjz6PX44jQz30KhwhI5M7ftFB5/9IoBbNFVidqNOJuz2e/TRVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fS6+GzCK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oWiixpdt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fS6+GzCK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oWiixpdt"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EHu9vQ1295786
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 21:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=VC7x7KHE92x79relAfS5cezFaS2U3Jgk6k3Vv3nURmg=; b=
	fS6+GzCK1LcXZltXZNrYRUadOShoQ2AEIqiGys77AAm2id3n0EMs7BjF4z6qkjYo
	o5LQ9NpoAlYpg7aaRvGBmEO3Khx7DflKv/URoacPS2dAkNVkrDziDQGfyag/3wV4
	L0ferqyf4ccDieFui0pXdtEVk68dJP7JAOkbUiShOHjA0oAc6az/giOp78HfN5WZ
	ZXgALJDMX6XmBE2wcE5enMsGXzvMpBe1svrp7SYCMIVa+gdi58+3XAQFZv4DnjRt
	91v5/Eo0gJOYA3rYdlXGWqw3UwWuBaVrnBCwr6FwMrtN0gGSXG0XycnNKADhAv/J
	rZ6tNk24lyMqKiv2ieOhXw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bp5tc19uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 21:09:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60EJFwKV000392
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 21:09:46 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013001.outbound.protection.outlook.com [40.93.196.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7eawj1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Jan 2026 21:09:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyKHM1z1vXBdo3sNaRPxkEhr+xuqi4/tbIfjdA5X0gx4/cOdMlA080/dUltAqkRb/mWcdkqCVtiAuM9Ues5IOZOIqPQb+8LhtVvJ+gUXV2+f+8qpD2sLps2mymJguAnxJgjnLNLDu6Sf4C9bXVBkSQg9pn+JpPzeGPghTtIQQu50LfBTpBQG60Opt2jB96v+ITSh1RaQ21m2cZvwKxpwhPCiYKaNbi2O2EVlyKdei5wBTqPd57qnyhBG4/N/nsJ6gUSM/bNlUMZncUPTpo1X4fJlpL9p7uOMfS/Cvguz9e3nDJ2z3J9qpkVtDCzhLBYNdBsZLzTDaERXyRhrJ2R8QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VC7x7KHE92x79relAfS5cezFaS2U3Jgk6k3Vv3nURmg=;
 b=jmUumQPQehGTnMB00bZxoWV6J4iGGiYUHuHSHQoaHcRSkflDXPynjvL/IDW2a9pLKnppPCT4SAVFzNBALzjmQ4Cy8kUq1j9IFQzNjdmMVUkUIizxjo2sAnhCxds8r3BtS5X4IoCceHqaTFeXTVmYLCFACBcdN1wTfiX+FlxCY7yfjgAQc2WaXiRPkdEd7QXP/i10OSoFxl5ztpHJYX8yV0GpEMLbU5dYKszuwIBM/0s066ouZycgmAImWrE0AQQz5tQPtkTFddvlbZCzkhrbbZFqItY87EuhtkBRB4Y/HirrzDxR22Fyd/xlXGd4qN+iWrE3LjzvBtahCCbMmNXuSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VC7x7KHE92x79relAfS5cezFaS2U3Jgk6k3Vv3nURmg=;
 b=oWiixpdtjpKNTC2rQhVIM3Rjwg3bhl1vhYLozZg5k+IhM6k4x0xmcfygZJ5WD0oHvfQdOx9th5HpiAJkxMkuJzpZyVtJ/C0y8sBmHPhMXUB6nuscO1ZMBfjYhGjZMaKALCtF9M3fFFbwNr9/w6CXmpbjeDlUV4Fh10rVKXTvCPE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4672.namprd10.prod.outlook.com (2603:10b6:a03:2af::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 21:09:42 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 21:09:42 +0000
Message-ID: <3d1c6659-84e1-fa4b-65f7-1fe96c254837@oracle.com>
Date: Wed, 14 Jan 2026 16:09:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Add support for printf formatting with non-monetary
 grouping chars
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20260114050936.14847-1-eugene.loh@oracle.com>
 <aWfFlMk3qXLzo8+9@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aWfFlMk3qXLzo8+9@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0063.namprd02.prod.outlook.com
 (2603:10b6:a03:54::40) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4672:EE_
X-MS-Office365-Filtering-Correlation-Id: e52d1244-5568-4af4-21f8-08de53b13c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjhCVWZmaVErbHkrNHZRbUxNajZ5MmRaMjBtVzR5cUhmZ2J5NlpKUGtEalY3?=
 =?utf-8?B?VkhRWXNyYzFIYmgwUE1nTkZOdllWSGRFc1l4aDNoTWRTUzFuMUo4TEwrTDQ5?=
 =?utf-8?B?RC8rNFlISTBLYW83LzliYkt5a0dsVHhoQ3dmdTUrL1c1OG9TMEt1Y01MOEZh?=
 =?utf-8?B?VjNyT0REOUF1aFRZNjFZdDI3dlM4Z25EWVdRS2JKeks3QXFHTFFlWXVUSnFn?=
 =?utf-8?B?K0N4U01FdkxVWGNoektNeWNvbWR6MkhuaVAveW10Znhqdi81RDNQTEl0Rk5v?=
 =?utf-8?B?Z0trT2RyeW1VT0JmVTlDTThFZy8rTnJvWEsyR29DSjZzUnc3L0hlUVgzOWpP?=
 =?utf-8?B?Wk1BVVpuTG9LZnhydmNtSE5FQUJDT1hockh0R3JOQm4zTmVDc1l3WmRwTHpE?=
 =?utf-8?B?aFg2UWVJc3FrSk1uekFjWU1CZ0lNd1pjWXA1TGdGUWtzbjg2QUhIOHljY2Nj?=
 =?utf-8?B?Qlk5ZTF5Z3Rpa2psTzV4U2JLdnQxNXdEZHpMZ040NWdvWjhNaU9yRXpXazkw?=
 =?utf-8?B?RndiZTdOMk85bjBIcFlLZUU2VDZCbS8wa1FUVEJUNzBJYXlmNWZxMEVzcjhB?=
 =?utf-8?B?YjNZZDJQU2NaS2pNZTl4eG9UVHlVZnFPNmd6VlBWNTVKdmNhNVZ2OTlObVM4?=
 =?utf-8?B?a3IxcXVHZlNwNWJFcUZNaHJndnZBKzEzclRRSklzUk1mWUkxNTdpd2tJZW94?=
 =?utf-8?B?WVBVdzNJNWl1V2sxZXlseWdTOFhhR1VRa3NxZHU0eVYzam1DZUxDWjdTRUFo?=
 =?utf-8?B?VnVORGk3Q0MrYkN1TkJjQ3RxUlYzT0VaemFpTElqbFdkcjhBVytEUDdDWDAr?=
 =?utf-8?B?Um9Tb2dHMk9CU01ieUJ1ZDlKY1ZLR1hyT21WckViVCthdXAvc1FGajJFWWNm?=
 =?utf-8?B?SDVhbk9uQUFhS3pROEJ6SFVMR0cxdnUxOGwrNGRyclBzc2xLdXJOMGJXdDR1?=
 =?utf-8?B?cVE5L1QrL1NGL1ZiNEVNY1JKWFphTG9QL2J3eDVpRzN2b0gzUjQ1Ylg0VldB?=
 =?utf-8?B?RXpJYVRiY003dWtUZWhQREFZb2xVWGpTNGR1ck1qUFNaODk1SFdmS1krU1JX?=
 =?utf-8?B?bG5iTXI5ZHlVWnhVbXQybEcyajFHblNjTE96LzhzQVlCRnJaV0lZNGlFRTQy?=
 =?utf-8?B?UEwvbmJKakpWbUNZQ3NaUXY5NGQwOEJncGNwVnp2Y0lrM2NvbmlpWHpvbnQ5?=
 =?utf-8?B?KzczT2UwTVpoVEpnRE0wZ05TR1REY1diZ1IrQ2xWbFhObkVjSVZKcjhLUE84?=
 =?utf-8?B?dEtsN2ZKOUM5eDl6azk2aWtFZlYvTHVwWkpMazdEeXBGQXNya05NS2lXYUF2?=
 =?utf-8?B?eEhiL1ByWTc2dVlxbnpmdmRuWTRMVExGd29BRzdCZVAzUXZHcWRmNmZiNlZJ?=
 =?utf-8?B?cEtja1hZaEtEVWRHQkhlTmJuclE4UjZKN1VYWlFTMExocE4yb0VTZDhPZnpj?=
 =?utf-8?B?UXljd051SEpmejhBejVzV2J2RTBUaldXejc3ZlkrOE5HU3NWaEMybGZ6WWow?=
 =?utf-8?B?MnVSQWQreHhJSzVFK1JuTUhobCtsMXFwMEVBSTBrOUIxWVNHaXZGWW9YcVQ2?=
 =?utf-8?B?QXA0N3FQOEVNTW9vY1d2MkNtWjZ2eDdPcDdBQW81d283TktuZyt1SnlpZ1dF?=
 =?utf-8?B?L0NLRTRxaVVOeTlTaHc4Rkh3Q05XTFZCZkwyUjRveFZHbmx0N3M3K05OZXV1?=
 =?utf-8?B?SUhOUkkyM2N0R2FabzJKUWlIWVdicTJBNGxIc0szREY4c1l4dXF3SGptaTBr?=
 =?utf-8?B?RHdWSElpNGVhcGREeUVva3BvemkzeFp6bkJIRFBrMlpEaEQrUWpRUlV3cGtp?=
 =?utf-8?B?alRkUVR5V0ZSRlk1WXVRMlRWZlJEWk45aWZrbDRBa0szQzRYUXcwRlBmL0Zs?=
 =?utf-8?B?eUZKWDNTV1FMdm5qaS9qaUVRUzBCOEwzeFVqNkRIZElLQ296clk3VmNyREtY?=
 =?utf-8?B?N091RUJOQWpMREFJcHludU1ydHFuWVZDTU5Xb2FNTHlEc0hPMkJ1QVJ6VG91?=
 =?utf-8?B?UWJ2V09qSTdxMjB0WFltaDJsVGJtem5pWTUrRjdiMzgveWhwL1NuTURpcnFC?=
 =?utf-8?B?Tnh2a1FCQ2F2T0ZGQVJNaW5JQm5CYzd0UWp1emFSN09MMzdSaWhhRWhNSUcw?=
 =?utf-8?Q?+XItPVB3aozajdT6iXeIn7hIY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjVQVmkrZTBsTk9QVHdjeGJjYTgyN0dna0x0Y2tqWUtZbUtybldpc2lFQjhB?=
 =?utf-8?B?YkZjRGpsV1NsclNGZnJ3TXkzK1dXa0dLOXJtRThkVVR6V05ZZjFxRU11NG0w?=
 =?utf-8?B?NHhZdVdvcE1YWkUrVWdFZjNLZjVuMExsZHNyVm5NdXN5WEFIa2owYjRFNHJP?=
 =?utf-8?B?RmtsY1dXVXZzb0NsL1JieGZFdkU2R21PcnRYN3NYL0cvNC9haUJBOTE2KzY0?=
 =?utf-8?B?Ly9MTHhQUWFXazJYR3V3dG95ZDBkQzd0cEdDUmFxWkpIb3F6VTd5ZFRmaHQ2?=
 =?utf-8?B?dG5FZDFjcXlnUU82clBjTzFxMkxIaEdmcFhieVArMlppZ2tPWkpzQUM1UENU?=
 =?utf-8?B?eVBxemVsYzJyUkhUQysrTnR0bU5wTnNJS2pyYjVTVUhKMURiMFpNZEpsU1ph?=
 =?utf-8?B?ZkpMelozaVBOQXF5NW0rTmZpWGpMQ0VCWkdaajdTUnl6WjRtN1dTemljazhl?=
 =?utf-8?B?SS9uYzZWM0V0TDNNeUJRY1R1Zm9uMWxoSFA5QWg4dTFKYlV5a1J4Ty9QL0NE?=
 =?utf-8?B?V3Axd0lESW1pRW0vQ2JEZFgySHhmRm1VQkU5UnhYS3lodFMxMi9XbHdDK0VR?=
 =?utf-8?B?ZGpHS2wxSkR1bTBvRDl4eWVrMDd6bDNRMUU4bU9PQU0rSXVjNDdUTzNMOGR0?=
 =?utf-8?B?V01NN2xnSGJabmcxd0wySE9PUEZFYXh3RVNUZ0FEUTlMR0ZlZFRmemdISUU4?=
 =?utf-8?B?bmQ0Qmt4WW9HMHFPNEEwek4ydVRmNUl6djVudEk0aGpPYWFEVVU2ckN6amo1?=
 =?utf-8?B?VFpCcVlOQXRUb3BEWllnWkoyUlA1WmNmNlh6T0hmaFhkczRjQ1QvYjh0cmFy?=
 =?utf-8?B?WG9xekw1c2Y4U2lnRWFWWENUS25xaTFHenRzejhnaHgySkpkR1l2TVJoNXVN?=
 =?utf-8?B?WElKc3phNnE0OEdUUkl1STNmN3BMWDFka05zYWJTMFVxbkJkbFNzRzJCVW9B?=
 =?utf-8?B?U2JwRC9RQlZVc2NOZ0hrSWJEZENJWjd3RnRaY2llRG9qd2JpQ2NPTEFVc1gz?=
 =?utf-8?B?Y1hyMFgzbGJmNUl6QjFoeGgzaDlVSDhGTldpaFN4Q0MrQkUraXFyL0tsdFMw?=
 =?utf-8?B?T3UyM3FtNUl5NkZrYUFBL2JQRlBsVEF3Sm8zVWQ1dHhhc2tsVHloWjc5WldC?=
 =?utf-8?B?byt5RzJRUDNNbmhHSkhLMUVLSjJtTmFyVGtENmpPVE1TV014SVA0dnJ3YlJ3?=
 =?utf-8?B?SVd5YkJFV1VMaUhzNVBiM1pYT2hzTlM0TzEzYXRMTm8xTE03MW9MSm5qeVJC?=
 =?utf-8?B?bHEzZFpDQnBxTnI5VzJkWWtmMWFxVFlVd0IrWGtNVThXREQ0V2dSVy9sOUU1?=
 =?utf-8?B?OFJNUEtNUm1rRlJmcldFc0tOWnFrbHV0a09VdTVsWG1leE5YNkxhVytUV0t1?=
 =?utf-8?B?OGxFeVV3NENwdFdELzlETWNZWlRwMnJYa0lCTlQ0UUJNTDVqRTh4L0Zvd3ha?=
 =?utf-8?B?MWlVV1RiakdFNUZxZkFBNXZVOGJsYTFvZkNYdjJkMUtzbndHUUhtbDVpYzd1?=
 =?utf-8?B?aGRScFMyblFHU0pVVnJ5VXlFdlBFalZzUEcrNE0ydC81cXVUaTh3SVdoUUQ3?=
 =?utf-8?B?UjZaaFB3K3BDVGVQUnRITU8xUzRqYld0Ly9KY09pbkFPb0tuMEc0dkJFelE0?=
 =?utf-8?B?emFDalY3UERRdUN6ekg2L2hoa29kTjl1SGJXRDhLZno1bmlXTHZXRHM0QjR3?=
 =?utf-8?B?MzhHcW1kTzZzMFdnZkpZbnd6VThDd3loRHRzWW85bklaMjA4ckxKZzZ5YUFw?=
 =?utf-8?B?cjhLSlRYWStDWldvUlJVdG9nZDNXVWd6ajNEekxNQlVFaDVDQmZuVzc3SjFL?=
 =?utf-8?B?YTdWVS9nU01ia2E4YmlrWTZLaCtQVUp3QVp4ZzlnL2NuelJaM3FaZTlPaDM0?=
 =?utf-8?B?VlNoc0dTRHZvaEN4UmVpSXZGMWpzWHByNzdTN0xFRlB3bUxSZ3FSek1CNzlo?=
 =?utf-8?B?VFBmbUNISjcxSU05Y1dDc0VlMlEyQ1NaZEs3ekhRTTdiZnAvbWNjRkx5Z0Rx?=
 =?utf-8?B?bFJKNGpRWmdjdkZaUTJGeTdGQUJpL21XTUJFNzI4TlltYjB1OGt1SWY5NG41?=
 =?utf-8?B?dFlJRFd1V1NmcHM2dm5ocDJSSE44bG45TU1mZlNrNHVSbE83RUtJMTNaT2E4?=
 =?utf-8?B?M2NqWi9COCtnRnZ6c0Z4ZmdTOGdrQ1ZveExpYUs3TkZLY0liaUoramJpdXVw?=
 =?utf-8?B?WkNVQ3NmYnFjVWRGUmFERjN5eE1VMXhDandRUE53Y0hhbUtwS1VIK096b05V?=
 =?utf-8?B?K1VJeTZJTWh6REk2WjRlUC8xUnhHZWl4RWxBeHhVUGR3QURTS1BoSVhGYUFq?=
 =?utf-8?B?MzdEbFZJZCtuUDJKcEpyRVJjeVorM2VHeHoyKzBXR201ODUyTDJ0Zz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gEjqNY+L+J6kA9Fdz04GIkW2xT2lpxr+FXuIvOM3f6ae9mVKcSc7+Gmdq0tSSVzmAIG6pzoHg+vAf8en/U7/eAqq9hjLvE9guhxSxZr26vRAZYJ+5yEjkoS5OUKVB2QJB50BnScJCvBIH7w+f5RFB6nE/GXntlrR/5jx2nIR6WYbuQP9pAU0+ozPYqucZc6DCkQIHihWe7B+dz1wiwB7MRcH09AEzQtSPKC2jXdkoPU3PvXJKxwGQKk6vCnOvn0l6i3ElWDVX1PZHIJ1e3RfY45xf9Rc447EqMHBf3Fca2p2pnncyhFL+Iwjye4NSL96V04BEqyclZs9SGzrYtwzNmeHlwqvBm5UyRfKow5cLCjQX5g5y3S4TCzbaeMoBodRi5r7SuLxqYxf9wa7Bc/2DHuOv6Q/95wiIMJxDCPJ57iS2G56TCXOQll4CiT+3RmPQrQan2/wV8xjJUvzxZluPSq65TB4AjS8+CXyzhkg+8O2gg1Zp6qwulkBl2T7kHmQaUoeMRHQzYS4l/lzwn2TwGqNvkV1IXUdDgsIYXY7GhRMtqj+ipaPoYfr1+PT+wjKvXzE4ISAf3dotDWLeymdYTcQ2FYXDbvz4hEL8nlNo4U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e52d1244-5568-4af4-21f8-08de53b13c44
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 21:09:42.0187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NWtATVnbugCEvwF3E6f0mhfrj0eKzkPubS+m5zsQNvlaM6lIBfeUXrXK9VE28hUFoiCTTbtty5mq2qUNMXwYnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4672
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601140173
X-Authority-Analysis: v=2.4 cv=XP09iAhE c=1 sm=1 tr=0 ts=6968061b b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=e0Euz-MFX4Dd2_N385wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:13654
X-Proofpoint-GUID: pipDq-DJ7I-tjs2mhc4-tSUcwKqHoIMx
X-Proofpoint-ORIG-GUID: pipDq-DJ7I-tjs2mhc4-tSUcwKqHoIMx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE3MyBTYWx0ZWRfX1c3Js58yL4UZ
 QlrVhXBPlmSY/Saeo1NIY4EYU4BDKvC2/u0qqXWKQ04T3VwMVE4Ivw/UD4sfObXgdT+qzRg8pRN
 GEodmdivZVMH4/D5/IltSCVX390ucaTC4uSt+uLbDQqQDnjsS9DgSItEhTTjMK/ohwXArxDd42W
 W5hYqKuH7K6NmSV+Oyh+3voyX5w7MVZpn3B3MoEzc7Iy+jEwWZSGmNv+WRIO2SCe18JuqPhgpq4
 DVcq3M5Vg0w8j1fItIfi066VwCMj/pfTAGAUVH4UYEUhFu73SVT7cCQCTWNqVkL2gwHucbPmdKd
 Rx6Vzd4ahFeQZw/yu00ssH4R6o9DyRcbXkTlZrbR3S/Nz3jdOcbr6u1BO5XWJbeRf/YKv7lapak
 Mz+kAGB8FUsgNGxhMMyfNV9Z0QGy1e3mGWK5ZwuMy00A8nQOQQJe6zU0yM26XN/oendV9QleSeu
 mGzJ7vIUSf34RDfLv76RSSR9vPJdBJiCR5twbsLU=

On wording and testing... gotcha.  I'm rescinding this patch. The 
replacement will have a slightly different title.

On 1/14/26 11:34, Kris Van Hees wrote:
> I would update the commit summary (one liner) to state that this patch fixes
> the non-monetary goruping rather than adding support.  The code was there to
> implement it - the only thing we missed was the setlocale() call to ensure
> that setting the locale with an env var would actually have an effect.
>
> On Wed, Jan 14, 2026 at 12:09:36AM -0500, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Non-monetary grouping characters are used to separate groups of digits
>> in numbers that are not monetary values.  DTrace used to document
>> support for printf formatting, using a single quote, for such grouping.
>>
>> Add such support.
>>
> This is also a bit misleading I think.  Not only does DTrace cocument the
> support - the code actually supports it.  Just the setlocale() call was
> missing.
>
> I think the commit message should point that out rather than potentially giving
> the impression that this patch implements it.
>
>> Orabug: 30430270
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   cmd/dtrace.c                         |  5 ++++-
>>   test/unittest/printf/tst.grouping.r  |  5 +++++
>>   test/unittest/printf/tst.grouping.sh | 29 ++++++++++++++++++++++++++++
>>   test/unittest/printf/tst.grouping.x  | 13 +++++++++++++
>>   4 files changed, 51 insertions(+), 1 deletion(-)
>>   create mode 100644 test/unittest/printf/tst.grouping.r
>>   create mode 100755 test/unittest/printf/tst.grouping.sh
>>   create mode 100755 test/unittest/printf/tst.grouping.x
>>
>> diff --git a/cmd/dtrace.c b/cmd/dtrace.c
>> index baa73e9d7..6cd7aeadb 100644
>> --- a/cmd/dtrace.c
>> +++ b/cmd/dtrace.c
>> @@ -1,6 +1,6 @@
>>   /*
>>    * Oracle Linux DTrace.
>> - * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
>> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>>    * Licensed under the Universal Permissive License v 1.0 as shown at
>>    * http://oss.oracle.com/licenses/upl.
>>    */
>> @@ -9,6 +9,7 @@
>>   #include <sys/stat.h>
>>   #include <sys/wait.h>
>>   #include <sys/compiler.h>
>> +#include <locale.h>
>>   
>>   #include <dtrace.h>
>>   #include <stdlib.h>
>> @@ -924,6 +925,8 @@ main(int argc, char *argv[])
>>   	pid_t pid;
>>   	struct dtrace_proc *proc;
>>   
>> +	setlocale(LC_NUMERIC, "");
>> +
>>   	g_ofp = stdout;
>>   
>>   	g_pname = basename(argv[0]);
>> diff --git a/test/unittest/printf/tst.grouping.r b/test/unittest/printf/tst.grouping.r
>> new file mode 100644
>> index 000000000..077a0b7f9
>> --- /dev/null
>> +++ b/test/unittest/printf/tst.grouping.r
>> @@ -0,0 +1,5 @@
>> +123456789
>> +
>> +123,456,789
>> +
>> +success
>> diff --git a/test/unittest/printf/tst.grouping.sh b/test/unittest/printf/tst.grouping.sh
>> new file mode 100755
>> index 000000000..13b953758
>> --- /dev/null
>> +++ b/test/unittest/printf/tst.grouping.sh
>> @@ -0,0 +1,29 @@
>> +#!/bin/bash
>> +#
>> +# Oracle Linux DTrace.
>> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>> +# http://oss.oracle.com/licenses/upl.
>> +#
>> +
>> +dtrace=$1
>> +
>> +for mylocale in C en_US.UTF-8; do
>> +	export LC_ALL=$mylocale
> Shouldn't you test both LC_ALL and LC_NUMERIC, especially since many sources
> seem to suggest that setting LC_ALL is a bad idea, and that people should set
> the specific sub-areas they need (since LC_ALL is an override for all and
> might have other effects people do not intend).
>
>> +
>> +	$dtrace $dt_flags -qs /dev/stdin << EOF
>> +	BEGIN
>> +	{
>> +		printf("%'d\n", 123456789);
>> +		exit(0);
>> +	}
>> +EOF
>> +	if [ $? -ne 0 ]; then
>> +		echo ERROR: dtrace
>> +		locale
>> +		exit 1
>> +	fi
>> +done
>> +
>> +echo success
>> +exit 0
>> diff --git a/test/unittest/printf/tst.grouping.x b/test/unittest/printf/tst.grouping.x
>> new file mode 100755
>> index 000000000..9993fbcd3
>> --- /dev/null
>> +++ b/test/unittest/printf/tst.grouping.x
>> @@ -0,0 +1,13 @@
>> +#!/bin/bash
>> +#
>> +# Oracle Linux DTrace.
>> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>> +# http://oss.oracle.com/licenses/upl.
>> +
>> +if locale -a | grep en_US.utf8 ; then
>> +	exit 0
>> +fi
>> +
>> +echo install glibc-langpack-en yum package for this test
>> +exit 2
>> -- 
>> 2.47.3
>>
