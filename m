Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581172F24
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753795007; cv=fail; b=d75nLsKASPbm/SAuWW59Cfijt5q1CMdiq10WE5/dG4zGGfvPRBOEQnTrYDcENDdfXLG7DzAMmYi0NZsmsDQCi+Tqs1JHWbkrCx4HU13rC8X/wS2z6h7C2TOcnxdRBI3PvXywobUynyr5hzdta6gmj0AqAq0hW6FXS0zIpTF+JyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753795007; c=relaxed/simple;
	bh=q25vzaV91S0qC+Yits9wy9vxjqYAN/5Qbx+a6M1zBhQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IPKY5SxEl3yUdW6jeO/T1TSA/aOoiM/vVEplDpOzRNw6PUV6ZKoinC2qDU/IeDhMZoYq6gHvhjtM7OFN+QXkAecfa/mUj3BqNjSP/qCya2S+ULvDZvWeKHrcPd4TD2kIBdQmGCHUyrPbqdxNF8Y/gg6RhWBxJ0uiyjR3luhOwM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NXocSdks; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Y9vd5s/X; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NXocSdks";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Y9vd5s/X"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TDE0cc009606
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 13:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ev4MCWFyr8Rl0FTqmZ7LNH5kGKiodZDKyJW+LYHu2ms=; b=
	NXocSdks97UO57YlyPHaELK9JVYmjFhHL50ay4rp+iWRmGJtrQ1A91jdkpsr2+mQ
	GsqAyv9sSWpDjH/v9oJew+YOgmNCaTef6acpNd9cblZNPpRw11weFvZe3OrqPiyj
	kN6TozZ3hmx/KOVPQtkBPsU2QuMoObb33ZjjBxp8okZ+g6fhr2Jdd8e6drfQDRgG
	GFWXqrVTuXyTkr1hZadeg9AOPLi0JhtcA6isdDvTpwhtqpUEkfJWU23zH9+2RtbS
	g7mDfabysxhF2ztg2PYCfRvvzmkI8cnQy1JFVqiDk5Boti73YteskW4K8lkDSllA
	OExhee1jnoiL0h9V0zZaLw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q4e7r50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 13:16:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56TBRoXN020524
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 13:16:42 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 484nfg5wt2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 13:16:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hn0nFsJ/+s7Hv5JK4PSsjxOQv94DuO5VggpF4ylLKPKjt/1f6874wotFNBeVaeNv6DML21D61teqezOAD91L/2UF9X+rMwVWNmAY+Sq10e3CruoiOGSSHcCeVd5b6BE+/WQIg3VBQ1QFo6WSRLCmQ5FePMIcWOu3O8AjUxMebyoJoRY+ewpcrZrxBzoRQQhC8cxc17G1F3/tj5NUi2nrovxveLiG8D6mZ+RMiAST46M6gMDcrwNA+WLqtXFXlHtxrG/Tv0SLPu9odh+/b9meYfJiytBcvtwgftL8i3e7JSijHf9O3DizVkd78uOEUT/KuX2B6FrcMS76rFhPXcRmyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ev4MCWFyr8Rl0FTqmZ7LNH5kGKiodZDKyJW+LYHu2ms=;
 b=uGPJEpJA7gLtoHWJrn8LH5+UIqufrIauiy7MGPhLl0X2R36SHxK3ovLBH99Vpeh9CTAL9Cw/YiCndIIiTFbHjq1Fzk01TojibYCa5vw5FrIMQmpeNFvW+MA5hkaaN+/5fq0Om6YY3KU3Zk+R1ydUjyDR8nZY3sdFq5MB5ruQw84+5Uw24gU0yvstSgheRA1HF39QOjMgOpcwNmpwK5driR96Hg9Jh5kXHHaW3H9xOVwC4F4meJ8Kps2kNW7bQhBEntWQ9TwDC/t0pehJ//g9YAyMCh3TI+BbuTueC6ZPfHT1i1GLVP157Z61bHrfF67TJDP6igfLg6TfLxzeSXvJ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ev4MCWFyr8Rl0FTqmZ7LNH5kGKiodZDKyJW+LYHu2ms=;
 b=Y9vd5s/X8fNBOFlbAT5JUTd+XFrGVAqAlKY8B/IRPgypQ9GN0+Tv5zeNCBdovRnKyulG/0gX/e8+q/nst87xnoy3htMyBxeovcPm2qrGhv9mtPZPn9ZmnL44IGVDbG6A307WW8cBTSiLjxzHocJKTVdUohoVoHYOEp/utXZ+l9E=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 SN4PR10MB5798.namprd10.prod.outlook.com (2603:10b6:806:20d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 13:16:39 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 13:16:38 +0000
Message-ID: <b832eb69-7eaa-4163-8586-3171965f5e43@oracle.com>
Date: Tue, 29 Jul 2025 14:16:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] selftests/usdt: add is-enabled stapsdt tests using
 semaphores
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250728163611.1570773-1-alan.maguire@oracle.com>
 <20250728163611.1570773-8-alan.maguire@oracle.com>
 <aIgsyUvMfwfauSZO@oracle.com>
 <8346533e-4625-4998-b145-04d3cc9079bc@oracle.com>
 <aIi1RfHbOcXFZpuW@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aIi1RfHbOcXFZpuW@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0094.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::34) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|SN4PR10MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: c20c55d8-70c3-4b9f-f5ba-08ddcea2267c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXlrcGxKTzEreXh6cGdCMkpKTDN5L05zZ0FEek14ZlY2ODRodVdaNEF1SXZP?=
 =?utf-8?B?RzZuN0t5WG5Ub041Q2dmaUFOQUNDZmVLaXByYUlZUitCOE9TUlVpTkg2K3dy?=
 =?utf-8?B?QmgwcWFQVVdlWnl2WnZadzl3TWJ2T0xhYTl6NWM1T1dIQlQ3MHFFSDNCc3RS?=
 =?utf-8?B?TU1CT0RBdWlWRDlXTDJTbCtJM2w1dUNPQjBFNHc1WUh1ZDdtUy8rb1Fva1Mr?=
 =?utf-8?B?RDhZNENTU296V2lwbXhBdmZtQVRMQmJKM05LUE1lNFd0T3lXUE92L2crcE8r?=
 =?utf-8?B?Vkpid0Yra25UYjRIR09taiszZWpkK0RJZFVYalJCem9GWU5HMEpuVzFHSHVE?=
 =?utf-8?B?NFNZeHNNRDVMM095anpQbjNnWTlXQnAzY1dkVHo0Z0ZRN1I0dzk1SDZUdTBh?=
 =?utf-8?B?b1MwcVJJaGFCVVcvT3l3ajA3V2phbDk3RUtOWC9BQk5XVS95Q0RibnlDb1RV?=
 =?utf-8?B?MEFkQ0ppMWFCSkltRnNaVHh2MUhJdDk4TG5aOFJ0YmVBVVNUQjhrUWp6Mzh3?=
 =?utf-8?B?YTJZQU5HTFlBMG1HK0pqWVEyQkhMZGhTcHIzKy9RQkFQZllRVTFzdVJvYXha?=
 =?utf-8?B?MlFmZUNibitlWmFPRzROalV1L0V1U2ZUQU1FMkhhY0Y3ZUp2UEtuZTdHT0FD?=
 =?utf-8?B?T3pRa2N0YUFyTHgyTG5IalVlVllVSURyZEVKWFlyR2pHMk5pZ2hzMFJwVFBw?=
 =?utf-8?B?dlJ2V3ZBMzZock1lRVM5c2JlUTdkK1ZveFRsUmVQRmZnYkFhbnJPRjgvRFBZ?=
 =?utf-8?B?dWJ0TFgyTnlDb1FWNU50eDFEUUFIcm5TYXlTZURHS2UwSDJvQXVxNWgyUkpY?=
 =?utf-8?B?ZHpHZWFZdFFjL3hwRGE3RXlOUUdTeDZzWFBUNjRCeVNGdm9QUG9WRW0wSFdi?=
 =?utf-8?B?azI0d2RQK0RNaGhoYjlnNVB1aFBYdEkvRlNqa2dRRzRxUWlJSmNuUGdrMVpk?=
 =?utf-8?B?bGhUTHpSKzViVE5HT3V3cUVDNXhtS3pFbnZoNWJobWs4czVkT1FQOEo0dElV?=
 =?utf-8?B?WWJaKzY2dXdHb3dReENINTFwQVhWSE1nWDQzM0l2OFBCZ2ptYXdFUS8yZit5?=
 =?utf-8?B?V2tySDhSdHJGNVRZdnJOeEtBQnRGSmwwbUtIbWpJODBTYm5PSWs1c2xtb2lD?=
 =?utf-8?B?S25hbmVvc1hiK2xIVkxZTkp2QW5va2N5RGlqN1d0QnhBajJLYVZwZjRCVnNV?=
 =?utf-8?B?SGo5U2NiTUVGQ0M5RjBETXFiS1BFWUloSXdmUzRGMmVPSDNVUjVNNXNURDE4?=
 =?utf-8?B?UVEvSjZZMzhvUHZKNklKRll5L1cyK3F1T1FTeXl1OG1WWWU0QkxZcGNNWk9H?=
 =?utf-8?B?bDJTMmxjU2d3U1FiRlVkZlk5Kzh3c3NHQlBYRHRtU0ticXVtb25WREFQd2tE?=
 =?utf-8?B?K3p0ZjNnelV6b0ZtRG1MKzhzaVJRL3NHVGo1Q0pHT3R2WDJxODdJcHdvSnJ5?=
 =?utf-8?B?OVY5Qk9lcXlLUXNIeC90c3pkVGZOMlFYVVUySC9FSXdGZFUvcm14ZTUxYW9S?=
 =?utf-8?B?VW1NemxqWmwzSFhLdkVDNDRCekJxRDJVakVxMG1WWmRiSzExYm4zRDFpbzNr?=
 =?utf-8?B?UUFsZFR6WTdRcG1WNUMwTUVqVUYrTUE5MUJLdjUwVUdhNkN0OWozcUYxb3JM?=
 =?utf-8?B?WlhLNnNpU0Rjb3U0MVVmaGRLUWJMbmtNVmFEL2N3bkhldThVVjNQRXBUZDdZ?=
 =?utf-8?B?NGs1djVQMHIyMnJOZTBNc0lXcEZBeWRMSHllcGJJV3d4eGg3VzloMzVZY1pv?=
 =?utf-8?B?dkZuQ3VBNzZNak81ZGIyOUIyWGFQQmtuUDkzdDRvWXhmeVBZT2xwYWV2ZHlT?=
 =?utf-8?B?b0JwL0UyNjhKMjNZNjZ3ZVgyNFplTERCVk5TZUY3VmRmNC9TOUJ4bmdhUytX?=
 =?utf-8?B?SXNRSTVOb2FGdW45dDRDL1FOTWwwOUx0ZHFVWHFBL2svNEhFemNFdGdBeHg1?=
 =?utf-8?Q?ZXOXNc6azHg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXlXcmdpN2lkTjBDWG9DdXFsNkw4ZUM2aHpNVHVnZXVFTC8vVjRWWHlZTENZ?=
 =?utf-8?B?OVVBS3Y3M2FIVHYzdEJBS3RvMWlpWC9FTEh5SnB5S2hWYk1obi82SVhDTW9W?=
 =?utf-8?B?K3dPNkFIWDNFS0JST3c5dnVzcVpZdUtJV2NZemp4czQ4WWVadDJEcm1LR0Rs?=
 =?utf-8?B?b1pPaUU3VTg0akw2TmZYbXAzRDJHYjl4ZjFpTGZJczQwOHBFeXFBOHNqTEtz?=
 =?utf-8?B?aHQwRjBOcUdMTWk0WmphMVdRT0VxREFvTm93OUlMOGlqSnNIVU9sUFV4MUNE?=
 =?utf-8?B?aU9ndnFwNHYzRzBINEp0WVp5b05STkdvd3h5K0RvemRWbStGa1pQM1RWV0Vy?=
 =?utf-8?B?ZUVISDVhNXlyd2RPUXg1aW8wT3N0T3cxTlJocHRRTVdGV0t6eFdiTDVZSitx?=
 =?utf-8?B?L3orWXZPQ2RVQy9ZdytXSFgvMXBmSG1ab3lTUDRib1FHSktJclBFamJOeGk0?=
 =?utf-8?B?QUJNRGtjdjk5MFFkNW00cHpVNUwxVHNiMWg2Z2drMXlFKzI2YnlFMFYwVlNJ?=
 =?utf-8?B?cVM3NTgwRllkeUVZdjBzLzNmS0d5WTJNcGI0ZXp5Y0R4RnBlbHJKeWVyM1ls?=
 =?utf-8?B?TUw4bmMwZ00rR0UvRXg5QXQvY1VaL0k2b1VQM2hDeVRHMlZLVjE5Q1EwZW5Z?=
 =?utf-8?B?SGtTd0tVMHFoUGp3cmtkTzEzNVFseFZqKzFNNUxaQmlwZENsZjRtdDZvNitr?=
 =?utf-8?B?ZTJubGNXOHppK3JVYlk1RkVhbURyVUJyMG5DSkNqNktNYXVXclVnc2E4VWN4?=
 =?utf-8?B?c2EyeUgyRlJpVEpPZHo2NTlVWVd3M3hsSFRkaXNETXQyL2RxbGU0TjNKQlV4?=
 =?utf-8?B?TW9mODRvb2xnTmlYNGJ0TFpsOUlLVE5JT2k2QVloRWtIYWx4ZDZkODlZNHE0?=
 =?utf-8?B?cG5vYTg5cElZVlJ4RitCQkxjczF2SERFTHV3SWxnSzNFalExOVhGbFFzZHJx?=
 =?utf-8?B?dVBXamsyeldWcUszVW5Ibkg4cjZjVDFCZ0N5TFFyUDhRUFhnRk5HbDlSQkdH?=
 =?utf-8?B?MlNYWmZsQk5BaEs2VVo1ZnFpbS9HVk5TNy9KOXI3ZmpieldsZmtzVWpEanR2?=
 =?utf-8?B?cGtuWitNOWNPT1JkdXlkOExGaDdFbTNocmNDTXpQWFI5dU5WbGs5Z1BybXd4?=
 =?utf-8?B?T2U1RldFY1J5SDRoOEpjaGh4Qld2WFRxaHdZd0NMLzFRbDNtTENOR2huWVA0?=
 =?utf-8?B?Nm1sQVJWbHNhcEs1cFgwSW1sc0I4OUJXZVkyQlk3RWh0RFBCVU44Qm9aejhE?=
 =?utf-8?B?blB4ZENnNEJrWERmcGdkeTV4TnpDRFdvaTFUR3g4dEpPaTZDcWVucU9DcFNh?=
 =?utf-8?B?UXFaeEZlYVlpSkJ3M3JHelZteFJRYWxJa01SWnNNQmxma1JJcmpyWUNkQncr?=
 =?utf-8?B?bFNnaTV3em8yTEtxRkR5RFNPckU4KzNUQnlYdjRQeU50NFFxMDJEeFEwcHN6?=
 =?utf-8?B?YkxjVFlOTk9XSFZRL3MzbElFaUJMY0p4R3FoWnluZ0FuNXFnMFY0K3V4Nklk?=
 =?utf-8?B?V2pXQ0xRYTdrRU1kYmdWUG5la0hUUW90d2dhRUNrWWZrQ2Z0djZKTGpESjNF?=
 =?utf-8?B?WjdudXNvNTlkL3BhNGRYdHoxaVFnbDA1TUwvUExQeUY5UE1vN2NabXlTTklh?=
 =?utf-8?B?Wk83bkFqeDV6cTUxYU5nNmdERXhyZERHR050L24rZnFXWkl2VHNBVFAwKzBr?=
 =?utf-8?B?S21VSlRuaEJldTllNi80NFB5MGkzOEY5UzQ0T0w0N1NoUTQvUGc0SXlXUS9W?=
 =?utf-8?B?YitQOGlXc1hCMXhBM25TNU1HMTI1TGNtS1JYZDFrWm9nSm1lbkIxdmZMVlhy?=
 =?utf-8?B?aHlINEd2MmQ3WXlvSWc2YXBjZHYyZHQxMkEvcEp0cjNYMzUwMVA1WmlpT0R6?=
 =?utf-8?B?VDBaY3AzcHJUZXNGUFoyWkgvVkFqZFFqU0lKdkkxdVloRzhPWmFqUlcwdjRE?=
 =?utf-8?B?ejlzaWRQWnFFalNjWk1NUk5wcmE4RUFjNlNodXl4dG9WbzhvYXh5RS8yZEFR?=
 =?utf-8?B?VjNNUzA1Ujk0VFBuT2RJQkN2UFVKUHFFUTBKOGovMVFrNk9wYTZFVmJTLyty?=
 =?utf-8?B?cG9BbWdIbzV0U1lnOTY1ZmdKVlR4anQwYjh0OWtQb3JIeUpCUm5wa1IzZkwr?=
 =?utf-8?B?U0d5S2V5bkpUWFRsYnN3YW9ld3NCQVlQeC9CQmsyZ2x5SXh1c0pvL1JkY0gw?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5Nga2LdV0YodKuDVmpp0BKUuPgtnEK1rXPk8iIQGGJ0J73/EMUBccbCEBwoTm2xCZDzWA4Ms5Fb2mSZ0CGfra1ubonrfXpUifpckgNUUalW+NSK+S2ctQReRtyaV6ZMbv1/K/P24YSA/6f7Baxv60umor8JjaGb/2SOToYnwzA+oy48GQBFn9Nk7lCf5QFw11Ri7Q7OfnWnqNpq7QSBvI0JXn0YT2bA1qmBJOeBgXP8VbaKmSMlg6NtgXU4mVs13JA+4EjlwUdq9yraHA52JS+ZXIinicF3hUHlzID4BVlcub2QgfFbKru3rr3ylYf99EwLYmb6gAwMSRkkOJCJ8D8qqvJ8MMIFqo/wf6kmRGCEFWKZIkPhEX3b81/s+ADmvh6x2i/UsjdCWv7DwQuikhKFlrqWEDvlhedLQu5mAH4JtdpE7/Qpf94pCooSugFylipR26O8FQvflIrJ+y4ZDgb2fLE/yHdbvWdDJFAuIhnh37S5omJMnUrJCfpijCB7Pr2msoq/GGnodcpRGLf1xDhk6MWZWFOsFMS9hJK+4o+Bp4GQDTE84wJTzeZYsx+t8anY5Xyzu5b1VV/y7Z/8LJq2iBZf/U7Ms9TtiWi+TzW4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c20c55d8-70c3-4b9f-f5ba-08ddcea2267c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 13:16:38.5810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/pEiKCeg1at9rrioDSegn0c+hiaUSqJp0wSyp8k6zmgMKa8A/vFwgg19XzjYG/2oG3JUZ5gNEIepAyUybaDkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5798
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507290103
X-Proofpoint-ORIG-GUID: V5j6KlIRCU1u2MmyhD6yZtvpX32_tU-P
X-Proofpoint-GUID: V5j6KlIRCU1u2MmyhD6yZtvpX32_tU-P
X-Authority-Analysis: v=2.4 cv=QZtmvtbv c=1 sm=1 tr=0 ts=6888c9bc b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=D2nU2ZGmHxNO7WfJGpIA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12071
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEwMyBTYWx0ZWRfX+rnUOJ564j38
 oIrBSAVAPJWSQejQ8/A6BecN82yhCIVrO5SUBgGOchSZYJGYTjOSAQHQHVO9GLMtoIo+Vxd48/I
 g53ZRo9BWNffijTWpR/8CsG12Yv+oqzRBuGHvD9lWmdSwkCI2ZERgdYgwjZMeo1fh0X5Z84RGxy
 L4D9E7Gz/ssd/vkhQU6Kn+5fOok4KTy/MF8Ae6n/Wnrl7I5yJ5HiCXAIvSZeaBA3+61iadRse9f
 8GE/HFIKU0ebQJhWuA5lR0d9KVYqdAJMW8zfzf/3ay+xj4VP2jMB+SXefX/iE64TJepc18B/l/K
 qbvDTk70/lp5hHG8PIRtLw9h+11IkN+X90nmZvCVPIn2do2HOhPTIdvJ1Isl9h0vjT537RFAR9X
 ogoX2aEhJm1D49RmeIQVcB3/Lfj4+lIOjrXtWQHxjkAln6Cv/sqh09H5vcccpaSuaQ2R3/aK

On 29/07/2025 12:49, Kris Van Hees wrote:
> On Tue, Jul 29, 2025 at 08:37:16AM +0100, Alan Maguire wrote:
>> On 29/07/2025 03:07, Kris Van Hees wrote:
>>> This test is flawed because you never initialize the semaphores.  If you change
>>> the code to assign 0 to then, then the test fails because the probes never
>>> fire.  That makes sense because your implementation does not actually do
>>
>> Hmm, I don't see this behaviour. If I change the semaphores to be set to
>> 0, i.e.
>>
>> -unsigned short test_prov_zero_semaphore SEC(".probes");
>> -unsigned short test_prov_one_semaphore SEC(".probes");
>> -unsigned short test_prov_two_semaphore SEC(".probes");
>> -unsigned short test_prov_three_semaphore SEC(".probes");
>> -unsigned short test_prov_four_semaphore SEC(".probes");
>> -unsigned short test_prov_five_semaphore SEC(".probes");
>> -unsigned short test_prov_six_semaphore SEC(".probes");
>> -unsigned short test_prov_seven_semaphore SEC(".probes");
>> -unsigned short test_prov_eight_semaphore SEC(".probes");
>> -unsigned short test_prov_nine_semaphore SEC(".probes");
>> -unsigned short test_prov_ten_semaphore SEC(".probes");
>> -unsigned short test_prov_eleven_semaphore SEC(".probes");
>> -unsigned short test_prov_twelve_semaphore SEC(".probes");
>> +unsigned short test_prov_zero_semaphore SEC(".probes") = 0;
>> +unsigned short test_prov_one_semaphore SEC(".probes") = 0;
>> +unsigned short test_prov_two_semaphore SEC(".probes") = 0;
>> +unsigned short test_prov_three_semaphore SEC(".probes") = 0;
>> +unsigned short test_prov_four_semaphore SEC(".probes") = 0;
>> +unsigned short test_prov_five_semaphore SEC(".probes") = 0;
>> +unsigned short test_prov_six_semaphore SEC(".probes") = 0;
>> +unsigned short test_prov_seven_semaphore SEC(".probes") = 0;
>> +unsigned short test_prov_eight_semaphore SEC(".probes") = 0;
>> +unsigned short test_prov_nine_semaphore SEC(".probes") = 0;
>> +unsigned short test_prov_ten_semaphore SEC(".probes") = 0;
>> +unsigned short test_prov_eleven_semaphore SEC(".probes") = 0;
>> +unsigned short test_prov_twelve_semaphore SEC(".probes") = 0;
>>
>> ...the test still passes. Are you perhaps initializing the semaphores in
>> main()? This has the potential to overwrite the kernel-updated values
>> which are incremented when the probes are enabled.
> 
> I put the assignment before the SEC(...) which may have caused the semaphore
> to perhaps not be created as expected.
> 
> Also, do you actually need the SEC(...) for this?  From the look of the code
> in the kernel, any offset in the inode would work, and unnless I overlooked it
> I also do not see anything in the macros for systemtap that require a specific
> section for the semaphore variables.
>

yep I think we can remove that requirement alright; I validated tests
still pass.

>>> anything with the semaphore, i.e. if the probe it relatees to is enabled, 
>>> nothing happens to the semaphore, so while you do store the address of the
>>> semaphore in patch 2, it is never used for anything, so this test passing is
>>
>> The refcntr address is set in parentheses where the probe is set up -
>> see uprobe_create():
>>
>> 	if (refcntr_off) {
>>                 if (asprintf(&spec, "%s:0x%lx(0x%lx)", mapping_fn, addr,
>> refcntr_off) < 0)
>>                         return NULL;
>>         } else {
>>                 if (asprintf(&spec, "%s:0x%lx", mapping_fn, addr) < 0)
>>                         return NULL;
>>         }
>>
>> The parenthesized value is then handed off to the kernel to
>> reference-count probe enablings.
> 
> Ah, overlooked that :)  My bad.  Sorry about the false alarm on that.
> 
> However, there definitely should be tests that also check that when the probe
> is *not* enabled, the code is indeed also not executed.
> 

Good idea. How about the following; removes the SEC() specification,
initializes semaphores to 0 and prints a message in the is-enabled
clause of a disabled probe which we expect _not_ to see since the probe
is disabled. With these changes the test passes:

diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
index db6d18cb..80271b89 100644
--- a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
+++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
@@ -8,7 +8,6 @@ test:main:six:16:17:18:19:20:21
 test:main:seven:22:23:24:25:26:27:28
 test:main:eight:29:30:31:32:33:34:35:36
 test:main:nine:37:38:39:40:41:42:43:44:45
-test:main:ten:46:47:48:49:50:51:52:53:54:55
 test:main:eleven:56:57:58:59:60:61:62:63:64:65
 test:main:twelve:67:68:69:70:71:72:73:74:75:76

diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
index 99fcc844..c73ef7fa 100755
--- a/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
+++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
@@ -23,24 +23,23 @@ mkdir -p $DIRNAME
 cd $DIRNAME

 cat > test.c <<EOF
+#include <stdio.h>
 #define _SDT_HAS_SEMAPHORES 1
 #include <sdt_notes.h>

-#define SEC(name) __attribute__((section(name), used))
-
-unsigned short test_prov_zero_semaphore SEC(".probes");
-unsigned short test_prov_one_semaphore SEC(".probes");
-unsigned short test_prov_two_semaphore SEC(".probes");
-unsigned short test_prov_three_semaphore SEC(".probes");
-unsigned short test_prov_four_semaphore SEC(".probes");
-unsigned short test_prov_five_semaphore SEC(".probes");
-unsigned short test_prov_six_semaphore SEC(".probes");
-unsigned short test_prov_seven_semaphore SEC(".probes");
-unsigned short test_prov_eight_semaphore SEC(".probes");
-unsigned short test_prov_nine_semaphore SEC(".probes");
-unsigned short test_prov_ten_semaphore SEC(".probes");
-unsigned short test_prov_eleven_semaphore SEC(".probes");
-unsigned short test_prov_twelve_semaphore SEC(".probes");
+unsigned short test_prov_zero_semaphore = 0;
+unsigned short test_prov_one_semaphore = 0;
+unsigned short test_prov_two_semaphore = 0;
+unsigned short test_prov_three_semaphore = 0;
+unsigned short test_prov_four_semaphore = 0;
+unsigned short test_prov_five_semaphore = 0;
+unsigned short test_prov_six_semaphore = 0;
+unsigned short test_prov_seven_semaphore = 0;
+unsigned short test_prov_eight_semaphore = 0;
+unsigned short test_prov_nine_semaphore = 0;
+unsigned short test_prov_ten_semaphore = 0;
+unsigned short test_prov_eleven_semaphore = 0;
+unsigned short test_prov_twelve_semaphore = 0;

 int
 main(int argc, char **argv)
@@ -65,8 +64,11 @@ main(int argc, char **argv)
                STAP_PROBE8(test_prov, eight, 29, 30, 31, 32, 33, 34,
35, 36);
        if (test_prov_nine_semaphore)
                STAP_PROBE9(test_prov, nine, 37, 38, 39, 40, 41, 42, 43,
44, 45);
-       if (test_prov_ten_semaphore)
+       if (test_prov_ten_semaphore) {
+               printf("should not see this since ten probe is not
enabled!\n");
                STAP_PROBE10(test_prov, ten, 46, 47, 48, 49, 50, 51, 52,
53, 54, 55);
+               fflush(stdout);
+       }
        if (test_prov_eleven_semaphore)
                STAP_PROBE11(test_prov, eleven, 56, 57, 58, 59, 60, 61,
62, 63, 64, 65, 66);
        if (test_prov_twelve_semaphore)
@@ -138,7 +140,6 @@ test_prov\$target:::nine
               arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
 }

-test_prov\$target:::ten,
 test_prov\$target:::eleven,
 test_prov\$target:::twelve
 {

>>
>>> actually accidental because the semaphore initial value is (apparently) most
>>> commonly *not* 0.
>>>
>>> On Mon, Jul 28, 2025 at 05:36:11PM +0100, Alan Maguire wrote:
>>>> Is-eanbled probes are implemented using semaphores where the
>>>> semaphore address is specified in the ELF notes and passed
>>>> in at probe creation time to have the kernel reference-count
>>>> probes; this allows us to have argument assembly code that
>>>> only gets executed when the stapsdt probe is in use.
>>>>
>>>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>>>> ---
>>>>  .../usdt/tst.stapsdt-notes-isenabled.r        |  14 ++
>>>>  .../usdt/tst.stapsdt-notes-isenabled.sh       | 151 ++++++++++++++++++
>>>>  2 files changed, 165 insertions(+)
>>>>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-isenabled.r
>>>>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
>>>>
>>>> diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
>>>> new file mode 100644
>>>> index 00000000..db6d18cb
>>>> --- /dev/null
>>>> +++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
>>>> @@ -0,0 +1,14 @@
>>>> +test:main:zero
>>>> +test:main:one:1
>>>> +test:main:two:2:3
>>>> +test:main:three:4:5:7
>>>> +test:main:four:7:8:9:10
>>>> +test:main:five:11:12:13:14:15
>>>> +test:main:six:16:17:18:19:20:21
>>>> +test:main:seven:22:23:24:25:26:27:28
>>>> +test:main:eight:29:30:31:32:33:34:35:36
>>>> +test:main:nine:37:38:39:40:41:42:43:44:45
>>>> +test:main:ten:46:47:48:49:50:51:52:53:54:55
>>>> +test:main:eleven:56:57:58:59:60:61:62:63:64:65
>>>> +test:main:twelve:67:68:69:70:71:72:73:74:75:76
>>>> +
>>>> diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
>>>> new file mode 100755
>>>> index 00000000..99fcc844
>>>> --- /dev/null
>>>> +++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
>>>> @@ -0,0 +1,151 @@
>>>> +#!/bin/bash
>>>> +#
>>>> +# Oracle Linux DTrace.
>>>> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
>>>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>>>> +# http://oss.oracle.com/licenses/upl.
>>>> +
>>>> +# This test covers all stapsdt probes fired by the STAP_PROBEn macros.
>>>> +# Arguments values are checked only for first 10 arguments because
>>>> +# there is support for arg0 ... arg9 only at this moment.
>>>> +
>>>> +if [ $# != 1 ]; then
>>>> +	echo expected one argument: '<'dtrace-path'>'
>>>> +	exit 2
>>>> +fi
>>>> +
>>>> +dtrace=$1
>>>> +CC=/usr/bin/gcc
>>>> +CFLAGS="-I${PWD}/test/unittest/usdt"
>>>> +
>>>> +DIRNAME="$tmpdir/usdt-notes.$$.$RANDOM"
>>>> +mkdir -p $DIRNAME
>>>> +cd $DIRNAME
>>>> +
>>>> +cat > test.c <<EOF
>>>> +#define _SDT_HAS_SEMAPHORES 1
>>>> +#include <sdt_notes.h>
>>>> +
>>>> +#define SEC(name) __attribute__((section(name), used))
>>>> +
>>>> +unsigned short test_prov_zero_semaphore SEC(".probes");
>>>> +unsigned short test_prov_one_semaphore SEC(".probes");
>>>> +unsigned short test_prov_two_semaphore SEC(".probes");
>>>> +unsigned short test_prov_three_semaphore SEC(".probes");
>>>> +unsigned short test_prov_four_semaphore SEC(".probes");
>>>> +unsigned short test_prov_five_semaphore SEC(".probes");
>>>> +unsigned short test_prov_six_semaphore SEC(".probes");
>>>> +unsigned short test_prov_seven_semaphore SEC(".probes");
>>>> +unsigned short test_prov_eight_semaphore SEC(".probes");
>>>> +unsigned short test_prov_nine_semaphore SEC(".probes");
>>>> +unsigned short test_prov_ten_semaphore SEC(".probes");
>>>> +unsigned short test_prov_eleven_semaphore SEC(".probes");
>>>> +unsigned short test_prov_twelve_semaphore SEC(".probes");
>>>> +
>>>> +int
>>>> +main(int argc, char **argv)
>>>> +{
>>>> +	if (test_prov_zero_semaphore)
>>>> +		STAP_PROBE(test_prov, zero);
>>>> +	if (test_prov_one_semaphore)
>>>> +		STAP_PROBE1(test_prov, one, argc);
>>>> +	if (test_prov_two_semaphore)
>>>> +		STAP_PROBE2(test_prov, two, 2, 3);
>>>> +	if (test_prov_three_semaphore)
>>>> +		STAP_PROBE3(test_prov, three, 4, 5, 7);
>>>> +	if (test_prov_four_semaphore)
>>>> +		STAP_PROBE4(test_prov, four, 7, 8, 9, 10);
>>>> +	if (test_prov_five_semaphore)
>>>> +		STAP_PROBE5(test_prov, five, 11, 12, 13, 14, 15);
>>>> +	if (test_prov_six_semaphore)
>>>> +		STAP_PROBE6(test_prov, six, 16, 17, 18, 19, 20, 21);
>>>> +	if (test_prov_seven_semaphore)
>>>> +		STAP_PROBE7(test_prov, seven, 22, 23, 24, 25, 26, 27, 28);
>>>> +	if (test_prov_eight_semaphore)
>>>> +		STAP_PROBE8(test_prov, eight, 29, 30, 31, 32, 33, 34, 35, 36);
>>>> +	if (test_prov_nine_semaphore)
>>>> +		STAP_PROBE9(test_prov, nine, 37, 38, 39, 40, 41, 42, 43, 44, 45);
>>>> +	if (test_prov_ten_semaphore)
>>>> +		STAP_PROBE10(test_prov, ten, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55);
>>>> +	if (test_prov_eleven_semaphore)
>>>> +		STAP_PROBE11(test_prov, eleven, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66);
>>>> +	if (test_prov_twelve_semaphore)
>>>> +		STAP_PROBE12(test_prov, twelve, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78);
>>>> +}
>>>> +EOF
>>>> +
>>>> +${CC} ${CFLAGS} -o test test.c
>>>> +if [ $? -ne 0 ]; then
>>>> +	echo "failed to compile test.c" >& 2
>>>> +	exit 1
>>>> +fi
>>>> +
>>>> +$dtrace -c ./test -qs /dev/stdin <<EOF
>>>> +test_prov\$target:::zero
>>>> +{
>>>> +	printf("%s:%s:%s\n", probemod, probefunc, probename);
>>>> +}
>>>> +
>>>> +test_prov\$target:::one
>>>> +{
>>>> +	printf("%s:%s:%s:%li\n", probemod, probefunc, probename, arg0);
>>>> +}
>>>> +
>>>> +test_prov\$target:::two
>>>> +{
>>>> +	printf("%s:%s:%s:%li:%li\n", probemod, probefunc, probename, arg0, arg1);
>>>> +}
>>>> +
>>>> +test_prov\$target:::three
>>>> +{
>>>> +	printf("%s:%s:%s:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
>>>> +	       arg2);
>>>> +}
>>>> +
>>>> +test_prov\$target:::four
>>>> +{
>>>> +	printf("%s:%s:%s:%li:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
>>>> +	       arg2, arg3);
>>>> +}
>>>> +
>>>> +test_prov\$target:::five
>>>> +{
>>>> +	printf("%s:%s:%s:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
>>>> +	       arg0, arg1, arg2, arg3, arg4);
>>>> +}
>>>> +
>>>> +test_prov\$target:::six
>>>> +{
>>>> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
>>>> +	       arg0, arg1, arg2, arg3, arg4, arg5);
>>>> +}
>>>> +
>>>> +test_prov\$target:::seven
>>>> +{
>>>> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
>>>> +	       arg0, arg1, arg2, arg3, arg4, arg5, arg6);
>>>> +}
>>>> +
>>>> +test_prov\$target:::eight
>>>> +{
>>>> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
>>>> +	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
>>>> +}
>>>> +
>>>> +test_prov\$target:::nine
>>>> +{
>>>> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
>>>> +	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
>>>> +}
>>>> +
>>>> +test_prov\$target:::ten,
>>>> +test_prov\$target:::eleven,
>>>> +test_prov\$target:::twelve
>>>> +{
>>>> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
>>>> +	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
>>>> +}
>>>> +EOF
>>>> +status=$?
>>>> +
>>>> +exit $status
>>>> -- 
>>>> 2.39.3
>>>>

