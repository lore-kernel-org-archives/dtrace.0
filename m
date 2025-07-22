Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CB22E9EA6
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753191678; cv=fail; b=TBhtUR27AgHzSP75kPvQjkTG7pOREBcicuuEUSXf/yXzYovqSB/+y54JN4KlN/WnVf8EUazfaCe7kgBxumPUhLuiaYK/65GJfEz7Xlmz5KdGZQv5LxwE+EzuvQHRWsqR2agBJyw0XyUA4ieashvXvOT4KNHiOxPyKhnB3eciDmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753191678; c=relaxed/simple;
	bh=PkZYjiYweX2+LMl4ZKjrZwj2HDHnfTz8L4ygmUNj1Co=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=U/1UDsuqFEqxSCn27iLq4CfMwtsTLoRJoq3dTedGeI+dv5G21ZEZMfJLu5XJh/F8h39gywU20dYWHwfczOgrNQEq3R6jxnS+e3KQ9jQVhUQsPUP0vJzWjVPyGhM45Jtmej+YCClc1D7tllN2ZQ4QVpu3CQzGrFMFmqfUzwOPZDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=olI9QykB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U60n/4zY; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="olI9QykB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U60n/4zY"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M5TCov021346
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=WJX1mppjUo/6hlH4OKLpos4ewhEUI8yJKJ/0vtCccws=; b=
	olI9QykBIZjFXSSjTSzlXDMHXy8pf0QLe3Gy04ohrIrFesmaZwpZGnqDZi50EQl5
	4QKroOTa0GuDnSPtDg4I9G2maWJO3+uA5GX5eZybblNKKSdoverHql3AJIQfOU0A
	XgKormLHJDxGfe/R2gfHAjU9aNlIY5R9ROiY+DJr/p//bhxxE8tudfJHG1dq1u7b
	YiuB4Moin7QzLqmm/1eaCzZLxUaFih3DQexGX3ZuaWKrh+RbGyM8ZBK2EJxKNgUW
	gjy1OmU5UHU0AE3XRNUYawCL2iNo80+sIwu1N5YxtpeDr2blRJP1EfCIOrS/FXew
	Wv7joVOPBvAxIMO/K+K8KA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805e9nc3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:41:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56MDeOBN014400
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:41:13 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801tfmr16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:41:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbkSEEJ03g7+NXr9LUgA3z0SjjvMRzAR7/TZ/FU/PizApWubNn7102OpXeSH1yBwa4mmiTncjy+/Xyj8xZ71VzJuPv0TT5G89DZ3U2t6Vw4aOQZKidMg1i7AKMvFthRjYFij/Dxy9vh1nVQAACHTNN/svKWp9MIYNPZUIpw/nFhppLM0SDpk10nJqFvBu5fYzGaiWxcVv93VeR8kuNloID9eni3XXRWepr5XWf8gJE4U5b4FruP1PxsBtvQhwpSMeqVoMWaCvuLWNTn9WauZtMiUwwaLIgz1asl78HM5tbAPfnFFe2Lqi6F+umfXLWMsi502gPi86kQhQe3M7/rzlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJX1mppjUo/6hlH4OKLpos4ewhEUI8yJKJ/0vtCccws=;
 b=EMSN9ts/HXvHJ8P5YtA1wtRVLeBYywnltvtF80LuG8tMjMaBKKH+BrYWH6MjUrB4onLB8sSlkxbuqtpWpEYNVApBODhoOZ9BfU2Y82BrcKNnJ2E8SOFPUv+pO5yKDT42wjuEFlZUZ4BgLq24EhXTlEoAKYRtxJbNoEy5ERwp2CXVDkFUg0hs6zilXfaVyWVJoKX3m2vXEXvg82AXfGt+OfUZOR0PHLQU6TWQGtsOs0SS/8u0Y6PSLSPMENh7FW92d68ytukhKSommycjBfe4sScR0ck6HSrroFoquOvIsVoyGAutY/Fw99n5+lBkafU+1v6bAoVTDCmCYA0PvYCURQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJX1mppjUo/6hlH4OKLpos4ewhEUI8yJKJ/0vtCccws=;
 b=U60n/4zYF60gPxWVDXe9RLHbTT2obx+f08rS8KbPxtsUFHRcJFdli+tNFkWrKYxLJe0jOKk8ViN5PUYcTGW69BfXU8f9w+QqAwHjKIsT5wtdWwgdVCooCR/4uetBt7lkDch8ftY1tk6Ot2jwZhMUE2/F22e07npB5FrQP6EEKCY=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by BY5PR10MB4130.namprd10.prod.outlook.com (2603:10b6:a03:201::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 13:41:07 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 22 Jul 2025
 13:41:07 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: <dtrace@lists.linux.dev>, <dtrace-devel@oss.oracle.com>
Subject: Re: [PATCH] test: Suppress some white space
References: <20250609180647.4424-1-eugene.loh@oracle.com>
	<87cyb7enqu.fsf@esperi.org.uk>
	<10ca48a3-7e72-f0dd-4fdc-72baf3d52ac6@oracle.com>
Emacs: the answer to the world surplus of CPU cycles.
Date: Tue, 22 Jul 2025 14:41:04 +0100
In-Reply-To: <10ca48a3-7e72-f0dd-4fdc-72baf3d52ac6@oracle.com> (Eugene Loh's
	message of "Mon, 23 Jun 2025 16:33:28 -0400")
Message-ID: <8734ao5onj.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0225.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::10) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|BY5PR10MB4130:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c5147d-9380-426f-0f41-08ddc925692b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmpuS3NzbDdnVGxwNVkyczhtcXVQYWFHWlpzUnBTbk1zdytYMXZ6RHAvcUVp?=
 =?utf-8?B?cTM5WnBLTHJpakdqcFQ3VWUwQmcyNXlwcHhEazNTRHNUUVZrTGh5NWt5dEhy?=
 =?utf-8?B?OGdJWWtuWFdtOG55TWlJRGhxVjZxakphSWt4SGYvS2FZTGpBNmE0MHFmWDR0?=
 =?utf-8?B?OWprTWdEbDBpcXlJcno1dDdrNld0NElodElFK205cnZiM0FtRFVSTU1QbFpL?=
 =?utf-8?B?VlJrVG5mOEdlVW5ab3lyT1Eyd3dZaWYyMjhyMTdESkRUcVBsK2MxOTJ1V1Zy?=
 =?utf-8?B?SHpkT3FWYlltMzkwMWZnZXljOEtIZ1BRVEEveWV3S2NGaXArZFJxdnRLZGkx?=
 =?utf-8?B?ZytvaFdtdVZaRFVEUmsxbWJ1WjhRczdva1ljYkxaWXdXSkRtemx5OGtuV01x?=
 =?utf-8?B?SERzeUU0cm14NFd5ZHZhR1h1Rk5KUnVRTnlUMGZvWHJwdWtwRldYYWhkSzNp?=
 =?utf-8?B?K3RVVEhZUitmMVJWczU1d2d5TThqbjUxNHpPYkUvdlorRFBuWW9SMzdSZ2Ri?=
 =?utf-8?B?Rk1vbGRwRjN0VCs5Y0ViVE5IaFFXQkxkWU5nZjVzc2lpajZaWCswZTlrUjZM?=
 =?utf-8?B?bnc1NGdWSURYY05PNnRTT05MY1IvVjIySTBFWThQdkdWN21GRUw2NWFwaUlk?=
 =?utf-8?B?aUpyQ1B6NDd2ZzFLRnBGSWd1RG5LRjUxeVBXUU5IYUtGaXZqcGtNWjlUSXRa?=
 =?utf-8?B?OUZLc281dVcxelFyaklZbXA2M1Bob1F6QnAvbDBJdmlyQ3R4dGEyUjJoYU8y?=
 =?utf-8?B?c0pybVZYSk9obzhBSzN6WnZHTHMrcVpUcmp5ejUzd09ldDl1dHcrVzhWQllP?=
 =?utf-8?B?d2NDTk1oQTFJVUw5OUFPdnFTTUdFeFlZV1ZTd2wyS0RUb0tkbnFJQUhYSjZi?=
 =?utf-8?B?RkdQQkEwL0tmVlU1bHRxTk03SmphZjJVYndMSzJQS3ZoVXJBc0FXR1RIcmFh?=
 =?utf-8?B?ZlB4TUpueGlxTlZYeHRMclJuc1pnSFJJRmltQU1jSi9TR3VWSHp5VWhOc2dp?=
 =?utf-8?B?d0FYU1M5N25Sc09kQ01tTTFuNFBwSlVxenNYTzBRTE9IdnEvUXpKOVc3Zk1F?=
 =?utf-8?B?ZkVVTEN0V284V21taUkvdFVvY1ZQL0tnVXFtb1NQQjg0WVFPdWM4bTZ5OWpD?=
 =?utf-8?B?VE0vNkF6QytjQ0dwVU5JeFhyYjdKM3ovMTFybEpXRkEwL3JlYUM1WldUQ0dB?=
 =?utf-8?B?SjFRSy8zWWwwam9UV216Z3B2MVc1SmlqUnVybHZXVERIdkZncUhReS9QZVlE?=
 =?utf-8?B?L2NkTlRDV1Z3VFYrMFFIa2JlMVI0UWl6US9kYVBlZ2xEWHBTNXBFaWVuRFRk?=
 =?utf-8?B?ci9RWVJxWWJQVmZMNzRnSWNqcjZzc0NmSUV2VXhxblJqWXJvT0x3WVhZcVov?=
 =?utf-8?B?aVlJNU9IQ3VNRFh2QmZGalh3a1JmRDgyN2hCdHFzMUg3Y0tEc2NlU1FLVHhv?=
 =?utf-8?B?Zkl2VnFpY1VLM0hDUnNMYkpKN1VzSDRmUE1LdHNWMHNQVHgwaVdSR0QrU1hH?=
 =?utf-8?B?bFdmenAzbUdPMFNDNHU5a2VqU2UxSktjQWNNSlYvVFRremVKNmN0Zmx3Uk81?=
 =?utf-8?B?a3NjamRIVUU2aWFuMXd1bW1OWEd3YmpPYTJ4dzhic0NIME1yYi9WOFM1Y25S?=
 =?utf-8?B?c2h0OVgzTmlXNHhuUmZqcDVUeElOckF0cWdEUm1vWWZXNFoxZmhmbUVqM1Mr?=
 =?utf-8?B?NDREUXBMeTk3eEpuQU1aN1VmVEdLalFoaXhJMTVpSW5NMSt1V2RpeEM1YmNT?=
 =?utf-8?B?TlhCRkFKSFhORTlkcWhHaTdIM2gyRlF1WTNpWnRTVUNaNER5OGxXK29WSDNl?=
 =?utf-8?B?MDduZGpndDExcmlxeWhEbEJOY2dZSjNPZiszZ0R2aE5LRTR2RS9GRjgxU3Nx?=
 =?utf-8?B?a2dHekpGMEoycG4xQStWb25yT2VGVWIyNllRU0RJa0lrN2FwdXVyNmJCUGVU?=
 =?utf-8?Q?YPRPzCfJE3w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXJta0ZhTnMwRFhPOTkrTjR0TnpUcUJRQzFHQmtyN1VIbUljSmNNeFVPLzcz?=
 =?utf-8?B?SFZnM0ZxeVp4TDc3bFR0bmVGSVdxbHVvcThsbGQ1UTNnRkQ1UGpjUkkzRk4w?=
 =?utf-8?B?RVNOcGhVUENjWlk3VjExRWZEZDJTeVZUM1lnNEpZM1RVaUhwc1U3c1dTV3ky?=
 =?utf-8?B?ZXdNVGtJK2pkcVRQYmEzTHVNZHZwSDNFSmJqR3ZiSzh1VGdUS1V0dFJyTkhx?=
 =?utf-8?B?RVloWUZSZDR1aW5DZlRYd1JQRHlGeUM5WWlBUC9EcXhvdEdhMlhqOGJxQXV0?=
 =?utf-8?B?ZGZxaFBMUHYrUnhkbHJFaDNBbFE3UDhBNWRTbUZQZVZrY2tiOWNzcUE2TzVy?=
 =?utf-8?B?aTRFYUVhZmtpMTNHcFp5QytQbllIQVZhT3cza0VsV0M1V0FBTUEvcmVxZW90?=
 =?utf-8?B?ZHRabENQZWVZQU9qb0t3QWp1SkdKZ2dlZjMwVXowdFhnbTJkM2dNNGd0NzRF?=
 =?utf-8?B?QmhlLzUzYTV2VzFJQXJLelR3VWxyMmtDc3RER1B5YURzb2lRVEYrT2VwVEtu?=
 =?utf-8?B?RnIyTXZwTDBmU1hTWmVXa0RmVUhodnB2ZC9uQUpveXIrWUF5bkt2bVlBQmY0?=
 =?utf-8?B?eWZaREtUU3VZM3NwM2JTMXpOeUlZamlhOXNPT04xWERDeXo3Z1R0R0xLSXp3?=
 =?utf-8?B?NGRvZkdOdzBoSklOY2xrcTFqRUt5MzlHVm1UV1pWT0FsMXVjT3dJTHpKVlFN?=
 =?utf-8?B?WUNIZEpFK094MFpkQU1XTS8yT3IxWjlwakUxZEJuS3hnVW5oM0JHTC9nVGw4?=
 =?utf-8?B?Z3VJYjN5QXNveTBoMm03NDBkNmlaZkhHVHhWUXJIcWhWc0N3K0dmNDlFYThp?=
 =?utf-8?B?dno5OFZQVHlNdmRpNWhvbnNFTUF3MFZ0Q0NQVDZNSDhBdzVEMDRsTnVxQWdH?=
 =?utf-8?B?ODdQSURFWm1sVjZxNkVqVThjZ3BCT1RYdWtmTGRXZ3Zpd2U5RzJHVFRjWHhp?=
 =?utf-8?B?eUpJNkd0d09TbmpZK0RlN0hZNTNqdDkrTmkrTW1OaUphVWJSRUZFL3F4SWNL?=
 =?utf-8?B?QVhPSHFFN3BzbldtcjI4SzA4UVlrTXc3WEk0RGZLYXhTSzZ6aUt4aCsvbTkw?=
 =?utf-8?B?SDF2cGt6NGlqdTFVa1JHWUVneHgvclJucGlacjVWSS9PT3QySXpRVjdiS2c1?=
 =?utf-8?B?endyTGpmU0xFa2I0M2lwNkFMOEdQNDVnZVhWRFpwbzBLV1NoaVVQaW13UXJT?=
 =?utf-8?B?ZktFYWRiS0MwQ21wZmdCRTg2T2lKNmE0YWJkUFJJVkdiMWlDclFOMDhaaVlo?=
 =?utf-8?B?VmxOUUNCOWllaGFUS1VsdWlFZ0Y3Yi93MjJzM0gxdS9TMHk3bkRaVkNLa09W?=
 =?utf-8?B?MTY1amw4L24reDZTVmFiRm5sVlNoRkRaMDZwMmZEOUN6MXZJRGRhbnNrcy9W?=
 =?utf-8?B?WXNUVFQxNktFS0xHdzZoeG5pWEhJRTl1NWVWRzJKdFI2a0V6SHZzZnlveTdW?=
 =?utf-8?B?R1dPdEVnUEVCRDZiWC9LRllsTDZsQmdsa2ViS3RscXh0cnZSS25SRGd4ekl6?=
 =?utf-8?B?dWQ5UzFHaE1uUjRzZllpcFBKTjQ1RDQ3YXVjN1NyczFXYUd3UTRWaEdUSmRk?=
 =?utf-8?B?UHE5MGpLcEx2cHlTdW5ZVFIxekZhbWZBUGxNaklMRVJYQm5WeGdkUUJIc05w?=
 =?utf-8?B?Q0plS2VwQ0c4cWZSMmpsNG5ZMEdub3dBQzl3OFJ5L09Nbk1rN3lCVXVtK2pV?=
 =?utf-8?B?VmJ4NFJVckJxdS91aHVnaXQwYUhkeUZGZnl3NkVIbEdzTHpPTHl3cm9XcFpY?=
 =?utf-8?B?MkhNcDdTcFFFVjBLWUdKM1YvRVFRWXljYk5ocDZ5NUJuNmhIeDZUUWsxOHVq?=
 =?utf-8?B?K0czdFFaREJNc3ozQ2JVMGRhUUpxKzdqSmdYSzlFS015M1cra013dzhQUG5k?=
 =?utf-8?B?RitGVm00dmZxeFRZSkRpcDhwMU1IdDdXOGtlMDZCTnBXQ2tsWlN2ZHVnK0VF?=
 =?utf-8?B?VXN2ZllCOXlrdmJ5SUxGcGFhRXJzRHRFZC8vblBTbkNieFRnU1p4K1dRNTdN?=
 =?utf-8?B?MURPYnFSVm9QaEZWV3ljSG9yKzZEVGRZVUJlbVlKSnI3bXV5aXJUZ3BIN1dn?=
 =?utf-8?B?ZDAwOTBpSzM1TzZmVlZPWlhTQ0VMS1E2QXlKQTZKSUJGVjQ4LzBCRG92S01I?=
 =?utf-8?B?aW9RMncwMkhwTkEwdU9IbFVkOTNVUkcrZHJvTVc5WXIyM2VrS3NPRGQ3WGlR?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NOD0lfWuUt1RQCUgZoA2Z+Vmv9LJlYGQHmTZZ+HTSb1hcRrZeNxh/1vY2RmPA+f3BrlrhB86tuXA4FEah9vzBqc1recHJ44zzqoHzivuLZlsGKUpRrLG/VdTS/PRJUktjmDV0rlUDW/SOVKI0+GdQTkOlcyPWCGnyiHlmzQs0MtadqWMshTw0cvMY+Y7PhqdIu+OOzkuZqD6BngCHOu5R2sGQVt1mo+gjoBqrp+1Rl6e3swPgPFQSmeFdi3y7IXmR8ZIKLovDo7ide7JyvXxL5UbpTvw5Ga3+2NvBQiGTtI3a6rJs/FHEjM3GV2s8+8EMsNYXCrlAokfKSGLc1odzdw6ka/QQCyj8tWEdooM6H+yuguJoOCTkpdMvtSfqUUr4KAjQ4ANabkkhEaStlOtZQWbvkNtai9kEM3eC2x0avxN5XmtF54bAdYHwtBV+Ct9AzMFYggDur3a6IT2ULLKVQiA+VxafTTUAmpMC+9ymrP7SXGUgKuNZ3RwFMbe+ygPMiCGJgqREiFw/UbAa1R8lNwCOv3KTL27G168CaXIxkKrVrZei5JnylncL/3k22WjspnO4L6Z5ta3U+b8RcuOyXSd/H86rDtAl9LfzzWu6fM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c5147d-9380-426f-0f41-08ddc925692b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 13:41:07.4093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISzSuvvcCdz7jXF4x+yJuHug3X8ffHtVhh3pnsbWHjIC6fLSGzvQUSu2mjm11E/S4IBC6HSTwTX3rEKPhP9osw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4130
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507220112
X-Authority-Analysis: v=2.4 cv=eqbfzppX c=1 sm=1 tr=0 ts=687f94fa b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=HOrXK6HGWUO5VgBF17IA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12061
X-Proofpoint-GUID: y7WT-WJaeXpy9HKeovXfOzoOmvn2KLJQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMiBTYWx0ZWRfX4iE22dygbq0M
 aehYzefpH3DI/1O7LdMBWdqcFPHa6HH7A1tYaXkfISMlaOXGOMat9ZxUyP5G0ZxDl9AMOoidWE2
 2D0CceS9v5P+KEJI0PBLI+1MKCtHCl8l+LLu3LuyWQ6A0nRoV0XEI8FKogqPc4tZJYTILSWMw3m
 Vy+DMbedL04RrtImBe2/AYMG7K5LZL54N99T/tK0bsiiVQS33+hsdafQlsm5GEoHyU4xlh7G4af
 r6teEjrBU7jili6YK5dvQi1L8KYiCY9QCQ/U34YcrjamRw0BOXyz5k58DA5GChMj4BWAJ/M5uUP
 Svy1GBEtOF7kGgfO5qV/o2tgLKO+OzCEPEsbU6DkILU5Gye+5v+LogqYCSrvI5FzX0xyY/f2IAi
 cGxb042rSVNzY+Htt/uI4TK8K51sGjgPRg64Mths2ca3Yz/KntyTxzJ2i4d+waeH6yyF292Z
X-Proofpoint-ORIG-GUID: y7WT-WJaeXpy9HKeovXfOzoOmvn2KLJQ

On 23 Jun 2025, Eugene Loh outgrape:

> On 6/13/25 10:10, Nick Alcock wrote:
>
>> On 9 Jun 2025, eugene loh spake thusly:
>>
>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>
>>> The test suite turns pointers into "{ptr}" so that results
>>> comparisons will not be sensitive to particular pointer offset
>>> values.
>>>
>>> If these offsets change in width -- say, from 0xf0 to 0x100 --
>>> the amount of white space in the postprocessed output can change.
>>>
>>> Add additional postprocessing to a test that sometimes fails due
>>> to this problem.
>> Hmm... this would work for this test, but maybe we should change the
>> {ptr} substitution in runtest.sh itself so that it gets this right in
>> the general case?
>>
>> Something like
>>
>> diff --git a/runtest.sh b/runtest.sh
>> index 156e7dec8a1c3..c5703a81bc6d4 100755
>> --- a/runtest.sh
>> +++ b/runtest.sh
>> @@ -509,7 +509,7 @@ postprocess()
>>       # TODO: may need adjustment or making optional if scripts emit hex
>>       # values which are not continuously variable.
>>   -    sed -e '/^=3D=3D[0-9][0-9]*=3D=3D /!s,0x[0-9a-f][0-9a-f]*,{ptr},g=
' \
>> +    sed -e '/^=3D=3D[0-9][0-9]*=3D=3D /!s,0x[0-9a-f][0-9a-f]*\([ \t]*\)=
,{ptr}\1,g' \
>>   	-e 's,at BPF pc [1-9][0-9]*,at BPF pc NNN,' < $tmpdir/pp.out > $final
>>         return $retval
>>
>> might work. (Obviously the lines would no longer line up, but the number
>> of spaces would remain the same as they were before the substitution.)
>>
>> Lots and lots of expected results would need regenerating after this,
>> of course...
>
> I agree that one can make a case for a broader change, but I'm not convin=
ced that that would be the better way.=C2=A0 FWIW, there were
> these two commits
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6f398f229 test: Make tests mor=
e resilient to different prid widths
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 72a79b784 test: Improve resili=
ence of tests to ptr widths
> that took the narrower, more tactical approach to such a problem.
>
> I vote for the expedient route:=C2=A0 a "Reviewed-by" and we move on. But=
 then, in this case, my vote doesn't count!

I think doing the narrow approach for now makes sense, but doing the
wider one makes more sense in future :) I tried and it's a nest of
thorns, though, unlike hex number replacement there are many places
where we don't want to totally ignore the amount of whitespace in use.
So...

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

--=20
NULL && (void)
