Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3CF386570
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776203000; cv=fail; b=nw52STSNiabEWktyMRWCCftlbZelOHBdaKPq1DimzSivHI8fd4RVA75VxjOdNAlt5shE873t49yZFBfufx1p50oQnWnTWU4PaSsmWzc/WVBJII81YPAtRwYt9tMlNqcJixrWNVXTL3GS2rdFslOxb5GvX1KMpwhQajMfMyu6Uqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776203000; c=relaxed/simple;
	bh=4EFbvRvQMjdGTuax/lZGjbM/yuCLeJa0Bilu/xLUrIs=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=Rd+tYZDYiSieoVNmgCsOSXtqD293WTzYuE02wBJWE66fNz6CnKg9XE6UTcelXeFe49LJePxkDfWjFiyDpmq1CcZ2uHxbc98rN3NUXZnGIcwiJxfgZoapuiKkCq01rT1SFzeG0BkLS8WsX2PKqRwzt6QrHuq8uuYKZGMTiC+vIew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lsJwFVTx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qYROgaan; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lsJwFVTx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qYROgaan"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EGv4jq3230386
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=4u0+/aqacj32J0ub5JP+PUeqa2igOgnBqu+qFYwJChc=; b=
	lsJwFVTxx0uF3ooVEy3kpagf/dZVjdQa6w0vLKykeIg0kKBSL0VdXUXd9wcixF3u
	bUMmligtDqGzalgnau4+vdYC8Jn2E4qpCUO91+/17AfEyoZqHWWwMms/3lZ6iTV3
	0U/ujVkVJbjoZp684IEJajciLsrcmuycX/luvG3kqVds75LwdTkcKZ1b3jOFE6gj
	RYXdHV0Wp/Lzn1xnvw9+H1IlCeH+VO/cPNqSw5FTHanf0XAg7rAgMqlEZ+1jzf2R
	Q3WMnwzIYlN0c/x8MzjoGjftRgPu6BpH0yBtCTbJrLaPWsa+ak8fc5QN8ETLrBOQ
	Zq5Sty9TsDETcDAP5mGmPg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh867by6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:43:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63ELdRlS014957
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:43:17 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012056.outbound.protection.outlook.com [52.101.43.56])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dh7nma5v9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:43:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pj6DPTcjaZhX9wEMLgr3mos1jNUL6Yy6GjUMsUrU45JDPXuYFcBlb/GlwwgTsEBZdjB8jVvlM2BThow/cpRHpuqUAzqv0FjXAcCXfoYImfOVKuaWQdVDMQhRMNHVIGTTOOQG/2HZM2WAQZC1TRyAaTPCusY5AKyi+D5zHW1wlTq976oQih+WNEr/NrZl7FYr8wCcc+MFootGx/JgaFs4iDg8IpXlarwdiCmaa7YsoYeIci3CCz89xOo7pHCmqu1/w+HqmAhn3s9T60RJqoRx17yvuEZoCLsso/kvnME3JfTyocTNsacV+XQ9+WPNDHAsDQM1cEOBH8t2xDhVm/4sTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4u0+/aqacj32J0ub5JP+PUeqa2igOgnBqu+qFYwJChc=;
 b=KuzZx8awdC3Rew04VgL7H3+B/Isc0WP93q+H/pA/OgV3mzlo0/l8DZmkxD8CSgaa/eikYOBjB6foGV7xEm69gFe68x3yyoCuX/KYsZqez4vNTkmLl+j7WQq8Ox9iaxFAA+98GTTla1D1sYX9I2oXZMOe2TvDgsu13b0xcE4NRVNi9B33MQnDLlByRDVTNwTXcDCGqOucSTQv3A0LbRymb2gb8kbDCtBfiB3L7ojcyyk/DVAQX5FNJFh31Zdija2j5Tj1XCBOMTsSh30Yp2TsxBj9UreUgPfvyUVFazQqZE7j+mqphwZmbFQfELxn035gL8nIf37sHOt7FbaBdoMdrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4u0+/aqacj32J0ub5JP+PUeqa2igOgnBqu+qFYwJChc=;
 b=qYROgaan6yuLj62G/jZEHPHBNSYiA6Rq78W82z4w79dd5L9zVBFou0yT1VEmjBmP7oMzhiXN88XvlsFs68SVxAlmOXsW/pHOLlNhDviP2zilBvm+fzfDwnlcwjtZYdsNJfr6YCSQgI3tArR4PXGLDdHlNuTQbc3snIoQPtasQlY=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by SAWPR10MB997791.namprd10.prod.outlook.com
 (2603:10b6:806:4e2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 21:43:14 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%7]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 21:43:14 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 5/6] Possible uninitialized 'last'
 variable in usdt_copyin_data()
In-Reply-To: <20260331010224.16165-5-eugene.loh@oracle.com> (eugene loh's
	message of "Mon, 30 Mar 2026 21:02:23 -0400")
References: <20260331010224.16165-1-eugene.loh@oracle.com>
	<20260331010224.16165-5-eugene.loh@oracle.com>
Emacs: freely redistributable; void where prohibited by law.
Date: Tue, 14 Apr 2026 22:43:11 +0100
Message-ID: <87se8x1amo.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P123CA0047.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::16) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|SAWPR10MB997791:EE_
X-MS-Office365-Filtering-Correlation-Id: 5196d678-4d9a-4e00-e374-08de9a6ed508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eCIC7YrxJ8OF5+5FLYT2HpMrx8kYNOYgGCPgL2+sBDWFUo1jpLKr2xJUkRyCwX6qDcpiNsMKo8WTDshWXb74YwKMljTMffPcmL/45qPuVSwWcPQLaVsi2srKewGgucdCzr9TeKM6eMzgyCR15fDcbjQZ+IVWai9AP8Hcg8FJfh1Zhadk78vxmb8GJ2oGlEH2nmV/BOzxdK6EtNR6LZBLs5JaiRhOFRRMoOXgXQQfoVz63hhFoF8iVfbEozjqd3X4hXrpn9prbtXK77ZS7Egt2CDaO+smSKn1pG/F854NmmKf97hhPN4pAXruUznhLIHrFSYt25sb2W4edEaEt09r6REt5KiSQ63yT1HewGe1z0uS3vZkZzbe16ooWDhnzz9Z7xlQgW0fNKG4ml95aVbTb58cbgbjSn1sgs03j5cw2Db09dhINmnvzC36gtqtt25UM5ajjyW+x37rU1zSa3qT9gd5Z1y+f/OM0e0quLou8Cdni9DTWx64v8AbGKb3sX/zUiJalTnQvIoxg3MAxpnswFemMmo7BmQoOBfAzSSRtn0tdzPpt78aEyYM5RK6vlN8QS3V8u3X9VgmIfLIuGXbhyXtxAdbuFjF6jPUVWlXLXkUAzQ5E/DQEx30JMw1AqcUripAN5f7kxS3TczIKirg3eZATHZhqu5rj5vwaHOS26k009vqaulFAZ1HTht9+P9fU72XvCSDnVaOOmkerRjsu+jAmSd+++cgn6Q8+1j6VNA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnZtMDczVmhRNnBGb1RTekIyMWZET2o3VDYySTNXUXhadTZ5RFhFdkJiTUZL?=
 =?utf-8?B?YkNSYUtSdm5VSDk2WlFkOHk3eTRLQ21PREt5SXB6Vy9ybTFPVGZxcElBRXQ1?=
 =?utf-8?B?OVFJbEhYWlRRemFaditjb0RuNlVMN3h5NGc5UGlJM2x3KzlPUkltWnY0bTBi?=
 =?utf-8?B?MlA3ZkZqNUFBWVFLRTkrZ3EyZ3NTaGhvdXdUVHdpcm1QZXlsZmp5U0ZRcFpC?=
 =?utf-8?B?VEwrK2VOcUVJblpEYjBYZ1RmYkJnUjE2OENjT2FQTlNPRWN3UlRRdFgwZHly?=
 =?utf-8?B?d2pub2VpTDdraGFlOGtDczBVU3JWMTA1RUxLeGdtWURpNzVTQldMZjlhbjhH?=
 =?utf-8?B?OVlHbUM5VjF2Rm93dTg2RU5jVFo1NmFYV1dZb09aYW9kSm1NSWN2UzhYaDMv?=
 =?utf-8?B?UGlYa2s0RVhmbXp4cXJaNUF2bGtOY0lWbU55YlJFN1N3cVNVSk1CVnhWcUNm?=
 =?utf-8?B?Um1BN08vb0ppeGlTVDByNGVoVFRONFJCbmtDWU1GNDRtRTM3Q085elpwdWZG?=
 =?utf-8?B?QWFXWS8zUXJxQzFQZTBLNFhXdjBqazAyLzNReU01Nnh2S3dxV2lJOFZ1Nk1P?=
 =?utf-8?B?WldwWlVJc0phanN1R3doTGt6SDZBQ2h4Nzh6TUFMV01QeUlaRk9oZHVpcFdM?=
 =?utf-8?B?UmpFSG9KQjd4L0JQNktmSjRKOU1aRXpuTW9NOVFxZDdaS0NKSThMOUd1b0ZJ?=
 =?utf-8?B?bG5jaVpNb3ErRUZwRHlWM25sa0RzNTFqcDd0VmVlSUtHeXZpVC9DOWdZbUc3?=
 =?utf-8?B?bTBqcFlmZzhHNlpXUis1Z2tYSUpOWTVtN1hYRGxEc0RyS1lzS1ZUOGJpMXIz?=
 =?utf-8?B?cGo5WVloRHdwYkdvYWNGZnhDQ1NMcXR4WVJDa0hEeEQ4Y3ZtUVN4U1Yram1n?=
 =?utf-8?B?VzVzdSsydDUxb00rUVJ4WlZEeGxqMGlxUFhoMCtWQkVLMDhMSjVBZ2ZlZzVz?=
 =?utf-8?B?bEtDRWw5S0MrcFQ1d2cwMTZISUxvcnU4YkJSMHFMZldMTGRpanZ5Q3doOXVz?=
 =?utf-8?B?NDBrTVVnZFZrK2tnVFFMNFFjZHlGa2REVmFXYnYvUkh1NjN3YUZ5V29TeVJ3?=
 =?utf-8?B?UjlGNWxFWkRtMEVsUmw1Ylg3VUZ2SEh3Sy9xTVRYcGptdVg2MS9lZ3Z5dWV6?=
 =?utf-8?B?RDF5V3hZLzBiUnFXQm96aW85YzlFeE9yemk2aEl1UEc4cGlFYlJnRzNTalNT?=
 =?utf-8?B?K2NHdUh3OVRSdkNHUzRiMjM2aHAxUk05T1AxdVdaN1ZqZjEreXlvNkU0Skhq?=
 =?utf-8?B?amN1czl6citGT0lqRFJoRktrY2Zzam84cEh1T1J0aGNKZHd0OSt0b3picmRT?=
 =?utf-8?B?TzFKOUpkSEtmMGdvSUdySmdGOUVUU0wreUdYNGduTHRtSUhaNXNYRm8wZWpt?=
 =?utf-8?B?WjZQMmEzOC82OEkrOWhyZ2IvNkEzNjBWbUwxZ05SVVZXSENpWEcxWFFYSmg2?=
 =?utf-8?B?ZUpPd0tCalFOUEl1TnNTVTBDamhQTkNTMVNuUjVSUThPZFdFWlFheVBaTDNx?=
 =?utf-8?B?ajhQUWVLM3UrM1I2NC9hbTNYc1puL3NoeFpWQjFXTkdnbFRmc0hTczNjVktt?=
 =?utf-8?B?TDBRWGRyVXhPUnkzK1luYlBSR3Ntd1JXVHA3U0VPZ1lsdTZUVWZUWFp3RWQy?=
 =?utf-8?B?dXJ4K1h4dzdGS3Q2RUhLcHJxOEZGZUpwSEpxemhHK1FhTFBUZ3h0SCs1M2ZC?=
 =?utf-8?B?YnVXc016NCtlakkyRTBMSmIyRGV5OTFzSnI5TmFWQm05dENrem1qQnJnMGYz?=
 =?utf-8?B?SjdlTDZQRFI5TzJ4UkEzcS9XZnRHdGJoQnhXaUQxSUdKYUQ3QkZCRnZreks2?=
 =?utf-8?B?aTIrS0tualRhME11VjQyVGVDZ1N5U3N4M3FJd3QvcVdCTm9RMmVRZWMyRUJK?=
 =?utf-8?B?dXZXQjFWelllWWVQSGxVMWYrZHRmZklHOGh1andKL0NxYVA5ZmI3L0FvWjdJ?=
 =?utf-8?B?VGRFVDg3YUpsUUlsRkZadGp5NWNhcDY4eDdUT1lWR3N5U285aXpFVW1uOEhn?=
 =?utf-8?B?WjNlbjBqQlY2ZGd0MkdqNmlkWUpHRW5qeXZqdFV1aVlmMFBDMU56QkhMQlpr?=
 =?utf-8?B?OUtkdU1aQmpQdS9ESjkwa0xwWmdKaHNwdWRsNHBzaUs5bnBUeFhsa0ZUTVk3?=
 =?utf-8?B?dkpwZXo2SWlXTWZhbXhUMWRicHVpOGtKMFZIYWZaQXJPSksrZFFQL3NRSmZ3?=
 =?utf-8?B?WU8wY2JIREorQk1Uc2dSWVEvZklISUtSTlZDdjN2Y3VKU0hwUmd6YXV6SDhq?=
 =?utf-8?B?SVFrRFA1RFFKaWtlNDZRYUFTWXZrR1BRbFE3U3ZZRE1QLzRac0ZrNk0wSnA5?=
 =?utf-8?B?ckNNSEdsRjdCNlREa3B6V3lyQXlIck4yc1RFWURZTkFLZjRDS1EyUT09?=
X-Exchange-RoutingPolicyChecked:
	cLpIhFL8NLlZuf/X9EWEjWYTx32aSxWimtDN301ih/Awt5eirYwU/r4t7AF1rH4dO8EwBrboFi/CWvdun0hirP2L0Nwhc/ITHmnm18v7jC+z+GW0OLJIRbhQgOB9hrXnMqIgAU/gtpT8HoRScmtTgq+bk/PYSNnPqQ/bSw/AgHh14umcXOB54eDtX402kALs1p9tOTnK0eQW0v8fa6FVFlg4CJOtrMJ+aeJa91xBvgIKMwq7e/JJup9TiJeFGMxXmpwnQbs6VLF42/ZbtHyny9VktcgCZIe+lQWriCWHvRtxSUiMpNNJ6Rc34bUfU+K1TGjtkoky0LNoi/JERfOvVg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yhD7/2H6bEi/SCcKv9AHinVoOR6zt+ldgOF69pGRcYcOfWaby/HAL5JYNutfs0wPHtTPAquD7IZ47dySUepGjhdocIb03Gj33bpEXftrMpy4p7bKV4UlHK7YDyakaTzsz/OQ+CoPtUF25kdBoQm507HbGNLhz8BzSuySDgPnTvNiUCVVHrQ6SVEN4kOo6vcQ6od6iUk+bTfNCLng18vnVPLrZnppjj52iyE7p8jQ2KoGGOgYTsOOSwaO2CdLm8oJXcNI+l7p4N9A5peAHOgN0BDzV6PXzsv04vMAI6iqO5SHbO+w2SCWnLg5NKCmAKqYoXTXTPhS9yKJYhRoZcGpssLnLyRIaFV0iEASVU2j1Pi9+ZdK46IY2m7bOyMQFYeyYAJp9/NXWEiEeYJaGfpD49HtFVwvR6vnRlPK2l7Jwj97akFp+FDI/4EcNrtqHq6eDFNrK19kiQoZLPlkI3TNMyCGbBnKY9TD80mtwnOTvldj/buPc0irA/b8sE3DiJ2cJ6CnRpnS2lAnEzIx9NKtPdzVFFVkY8lvhpAWseTEQwyZj1VYk9b/a+23JF5jm9yv5ZZNQoOf3Nd5ZabAFE7OhTz8UuVqgEuVuJgXlLz7Dvk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5196d678-4d9a-4e00-e374-08de9a6ed508
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 21:43:14.6150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YhBt8tSl4gIw2Y1A0zlXSWDJkrjfFiy2RH1vhB4M+r7INkUh82m5It7KP74HdrF5fE0HcgT6nNqAsMaew77ABQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR10MB997791
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2604070000 definitions=main-2604140202
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDIwMiBTYWx0ZWRfX3JAgHpd+q641
 idoit+QM7D66liuGfoi5wlaGqhNq2+X9PDeVU0w2eh4s5tvKCDUzoai1Xn5BSYJg0JdBlV4eTSk
 UDzmPeR2e+YQ/xEnngp8QwJLFQrXtWbRp1nsT+DGLyl2nvW4+WIRqIY7VjrgCMEBCCkiO1juCun
 9+1weq+m9aRj6hAqMxVyhYNRKD0hAwslvCh1oiCKU4ei6sFSMFBYpGgEx122ap+QZvhgNfkrmeQ
 l3kWLtS9fOOUwSVjmnrpSV+36VczRY5qZBKXPN9RT0TNpVvTZb40M3tdgi8oiOS3BMEDMyqrHjJ
 Y+MVEJk4DBMHg8gbpbGqd+Ax4mF8H5RCs9k1tIVr8hcP/e4/wGr5+ddMmfrYW9NYQr+ddZFTxET
 1aF7GRAEST20q2+PEkGj5MPhdn7LrYDpFskm2HuWqOvBOaBnqLiudqSo7fnQQcZcXwiOkzGALhT
 l+0EsNIp3S92N6ps1Ip330xtSenzj65kSgJBihvA=
X-Authority-Analysis: v=2.4 cv=cbjiaHDM c=1 sm=1 tr=0 ts=69deb4f6 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8
 a=06-neh1dVgzwsOG5NJ0A:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12292
X-Proofpoint-GUID: wywh_WO44aJfRpVo4uQs7tuvHeIbCosj
X-Proofpoint-ORIG-GUID: wywh_WO44aJfRpVo4uQs7tuvHeIbCosj

On 31 Mar 2026, eugene loh told this:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Some compilers warn:
>
> libcommon/usdt_parser.c: In function =E2=80=98usdt_copyin_data=E2=80=99:
> libcommon/usdt_parser.c:191:15: warning:
>    =E2=80=98last=E2=80=99 may be used uninitialized in this function [-Wm=
aybe-uninitialized]
>     last->next =3D blk;
>     ~~~~~~~~~~~^~~~~
>
> Change the "if" check to make it easier for compilers to recognize
> that "last" will be initialized (and non-NULL even!).
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Ugh. Still, if it works, it works, and it's semantically the same.

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

--=20
NULL && (void)
