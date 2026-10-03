Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE662E3FE
	for <dtrace@lists.linux.dev>; Sat,  3 Oct 2026 08:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791016869; cv=fail; b=qzQ/9PVi4bB6+y1uhtakHnjjOlUR//5nlslTFNYtvM4+Y3wpE2AY2W1sZIxemh3FAFNn4unmOvy6HWaAh4rQwaOaPCwpxrCcc0qBHYjvfTcLiVHmStrXSaYUqhAdjwAm/vwF/vQeIxRwHgfL/3to67toarG2OlZoXCT6IwBTccQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791016869; c=relaxed/simple;
	bh=vHUgSYpI0cuiQsuaHQuMnhPvt2QRdR4Gb8usLKbIq1g=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fQ3TMPzHEKgbMs07DhM4WGZawMDXlFVG24j+fCYeaY9qar0ydgM0U0M+QGmZUwAs8NwJRQsrKQkfCknZF1Z7ZF+kcM8ImtSwBw2VdQDcGlt9S9zgk7muGomgecjrM83VsFZn6KYFDU19X609fhMDVOa9gZ602+/JFZwQFOPU8XE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qL0k2ZXQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mt+dJNtK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qL0k2ZXQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mt+dJNtK"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6936KvKx644022
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=hSYof08T834UJkqn0WpDtcv7j7jD802JiYzdvXHH7EQ=; b=
	qL0k2ZXQZCbYiky9457+cNyn0wA7iBXYjCjwtm5KR2vFz6k8Vxof6x88mX4BqHyf
	SL//Q5K07cA5k5TPJh6XkRdoN4R+2138KSeSx+QC1/eo953s7o/cMoVX8LExdPAX
	GvjtvLkXbuk6WIQH5+LYswi8JVhqIBLCqtPyg5YOxRf3cqoHlwSbvqWQwvvrMMWu
	/qSWq7cDlQ76BZxzxTz9XZg466jQITIVScGiO1WtrRmDJpsI/fBjKYiYGsTeOulG
	FFzmAWIfMryY+A+ygSAzenb/fJKBuNOGZJNVu79HRLZON/UcQf3ZVuXo+59nLGxw
	onY9Ehya8wxI0RIixs5v1w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h2sas049d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:41:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 6938ZLHH020677
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:41:04 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013061.outbound.protection.outlook.com [40.107.201.61])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4h2r5kwy19-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:41:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DywM0tyqK4/MpRoi+6LV1ElWT/a0xq4deFGXH20bhi8xN2iTirYDf8BX89ArHFLUhd5vvMR2NCre9eZFYn8qaH36+DxTkH6/FVmDQ3LeNu5aXxIhccsEanJ4/zpl5kKhnR5BQGb+phi6D1b+sX5Db1AW1qMOiw9+2XynpFBQ6HzLlf8vqLk7h2iZsd9waaLQ8dzODmQlK01G0Zb+Q8dWVnire16l4jLCbPwd3FW/1bSycngqC+BNaIaIz5+r/3kOz9/ZUazjt6NEzoLWHxM+6wiJrD2m0SapCVBj/g7u2/rtKHh8LuY5gX184QubOobrMf5NYgWr+zjVQZPXSCOigg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSYof08T834UJkqn0WpDtcv7j7jD802JiYzdvXHH7EQ=;
 b=g2fZEKpsDK6Nv1TlJeOENTePA/LA6osv8LJvug7mzMcP3dsGMKkmyl9VS5lkyiDFnQPfy+8eohRJQlCSNajGuIIP+e68Br0BQoS9t/aqsM0u1cnyabj2KQOwG3ghi+rGBDeaYy02SGDkgG6kcJW2aDpvZhmqMDoEVGy55V12/OpHQzs+3Y56qffZzph7q/0ZwtwybYK8EfYjaTMQMDdKpSuVvORAVNtLzF7nXaSgY7TffAgtNChIodhJGhK6oJSSKbsatErGdI257lV75eRTZ4zFdv+ccNFfGKSK9nMEGFYdyjg32RoM3Elymn/PcU1y45tOzyz4xS+oj3euiLLufA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSYof08T834UJkqn0WpDtcv7j7jD802JiYzdvXHH7EQ=;
 b=mt+dJNtKjzPwVLU1L0LxijFauePcq7tuUTpemoGBy9cwgGObbMqXHSST5kolNPCuru3HgGrq6OBSdtbkV/tQAOYkdjpCr8GzsKKqLf8nJnjkJfw2Q10tfXfbaa7mKnSgOkzL019wz1j/cOueIoeIQfTSVgMF84FEezsH7ui+q2c=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by CH3PR10MB7680.namprd10.prod.outlook.com (2603:10b6:610:179::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.13; Sat, 3 Oct
 2026 08:41:01 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%4]) with mapi id 15.21.0496.008; Sat, 3 Oct 2026
 08:41:01 +0000
Message-ID: <ade78079-4fff-4fab-84ca-acf07a43819d@oracle.com>
Date: Sat, 3 Oct 2026 02:40:59 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 5/8] parser: resolve explicitly scoped user
 objects
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <37fee739c845dcd5d178eaef977d98c2@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <37fee739c845dcd5d178eaef977d98c2@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0162.eurprd09.prod.outlook.com
 (2603:10a6:800:120::16) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|CH3PR10MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d40fd54-0e21-42ce-cbbe-08df212a0df8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|10067099003|18002099003|22082099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	tqDbu4hGv2qh65l9Zz4srk705/ltGS/rhYQ5Z/od6TSO3ww4DV+Dl9dN/yDhluP971YjvJWloSUHT7hwwc1PDkgan1GSsItx80JEj8lKMGxEMzWiYA5XGONkEJOfd8SqdT6oIK5oWmTlWNqVNSMRtfD5uMXOJ2aevuIBuXTTwbkztM+8eLPrwPmBgXWToNnIrWpNVviJ5U5aLxX5SF8ls06IEvVom9++aNQVFGZisexLQWLs8eNBqe9hg3TNyJrXfH4T0r1n3y3Ys+dYCiN8wSJcDbTtk/Ts6LlquZpCvNVDvaagfOJwVH8diNgsPP70MNYgttciHAN6n+YX2IlJ8lwLwenMxdaVPaO25k+5wMLQAY8e1F71b3yeQImmjTAuuIkqqF29aeJgeGJFmsADajIhfg/dn5uDc0xAvoHUGhPdQajoLrSZzqpfvqHtzZccW8TQZSgiL50rset/DjungDi1dmbpmkKKOONDEZzpssLQKn3yafN19Yhi8ajvI89JUxWFTGgJDO8eoaFizgEc+Ml7PpXAPm+U82AsHuHEiMXmhsBK8OwFUja5nUiayyXOgVyUGlsmo7jTA4CSMfibfiZGPg6ic/szxRCq1HJRrVrPhYC5Nqukat9yRBn213C/TlTh5JQ6/0+AAjXFlX0oenI9AZHAj7VB+Ampl28nqgU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHA4SDFtYjNoQnhueFpNTzFqcnNqZE43N05adS9aMGdTWTcxWEdrUGRveStI?=
 =?utf-8?B?d053YmZXTEFjVUpqN3hSVXdKWjN3REtuWld4Y3BXRmNyM1krM0MzaEI4aVN0?=
 =?utf-8?B?aVVLNjdKbDkwWURMWmhvZ2xGZkpaMlJ4bG03bUJvTXJEVjhjVTVST0VZTjJq?=
 =?utf-8?B?Y2hGUVd4UmhZK0Ryb3JHMmJ6a2lpK0FEY1k5VEZMYmhpVXNvOXpyYW9RUUc0?=
 =?utf-8?B?aFBIMHFaMWdVUVcyWmJzSGttRUZKTkZHTzZldmVRR0FPTHJ2azB0SCtKTXdu?=
 =?utf-8?B?RFRPT2RMT1drbUVMTTlwWGErMFdlajdISm1jQjQrYlZnVzZaRmdHMEw1Tnlr?=
 =?utf-8?B?VURmQTNmL1Y0TnVldW14dzFmdW1EOGQxNmhsempITXU1UjhzMElpS3FuQ09U?=
 =?utf-8?B?c3FLYWVWcDZaSXdUSDZZdzdQWVpRQW9XQUNJT055NDgySlJSOXVtcGNveFc2?=
 =?utf-8?B?c2FNR0hxaTNuMnhFamdzWU5hMU12R21BY2VaWW81YnBmZVBORFd5NVVNRlRF?=
 =?utf-8?B?T2xnRXQwWlJBOHJKVUlxNTdmaUVva2d6aU9EZWcwZmhPS1dwbjdnMGJKMGlw?=
 =?utf-8?B?Snd0UFdxZEUwdnkwTVhrWXpOOUVrMG1PL2RuLzd2c2NTWTlwS2tqUXF3WG1U?=
 =?utf-8?B?dlVHZ3hsTXNhNU1hMVBNSDJ0VlczTGNOMVpyUHRhWVo1LzBROVBUVmwxeHhs?=
 =?utf-8?B?blU2amtkd005YndLQVNNeG1INFBzeWtRdDVKMGRySmpMSDR1VDNxTEdQdFV1?=
 =?utf-8?B?dU9UWERwR1NPKy9SWmdEeUhsVFFiRzgyQ0hXOXlndUxXTldqTE5peWxvRkZR?=
 =?utf-8?B?NkZKSnhMb2Y3QTFBZjlGZU1ITmpPWGxDSlIzODZPRmtoNVZkdjNJN2s4QTF0?=
 =?utf-8?B?Z1JTUzBLRFkvc1hxK3JKbUZ4NVZhSFRKclA3TkRLMWVHbVc0N0ljV1dxSXNW?=
 =?utf-8?B?Y2JKSWxleXFBZFNnMzUrTS9hazlzbnIvcS9kbEN3NnY0cElDOG5NNkVvSWgy?=
 =?utf-8?B?MHFMN2pnLzM2eDdFQWxnYkFZKzRvdDBydkhyWUU2cmlrMHk2ZGhhbHBtbG44?=
 =?utf-8?B?UzBrRTJmYllIUGFEVHJOd2NMMnhuU29XQVFvK0dhWkNJTndicUZ0RmlHMnpv?=
 =?utf-8?B?c09lWGNhR1VCN3JsT1M3MHJSTGpXa2Z0WGUyekxlQ0txYmZGbTloenI3VFBZ?=
 =?utf-8?B?RVFobGh1QnhpeG0xbSt4WENVbXJlQnBoYlIxT0w1dXM2VkdpRmYveDQxR2xp?=
 =?utf-8?B?K0Nsb2ZDM2pIN3ZBSk1ua3Vhc25oRGNMN0grTm9mV2s1SHBDb3M4R3FObGZQ?=
 =?utf-8?B?Z0FVTnFOSHZLT05EVVdCZG5QcjBOZDREZ2o5Snl2RTBMd1czd3gvWWNaSjdu?=
 =?utf-8?B?NTlNY0ZsS0RWWGJUQ1BOdm9UQnZJRGhUNUdGS3dZMUtVK1VwN2VRbXhQb3Ja?=
 =?utf-8?B?NjJyQ0NuSTJEWEV3ajRuSDBnYnJkanlkVy94REFFdFVCZ0tRYWdLTkhvbmFW?=
 =?utf-8?B?MklHQnVyTWVpcjBXeFBSVHp3WFlyTkcyL1pwYkZHdEsvQklNNXpUR3c2WHNE?=
 =?utf-8?B?Wi93U0xsODBTaEFvaGdjdFBMM3MxWkdYYlkzUzhMaXhjNnRCWWxnSTVacEw3?=
 =?utf-8?B?czVycWZHdjk4V0Z6SlZCaG85UUdkbzZuUlpIb2xrT2FEUUFlcFRDZGEwVE1p?=
 =?utf-8?B?SCtHRmc4djlDL0JqMm9qMzRRUnNyQ1dkRDRmOGdidXJadUhTZEZyTHE2TEwz?=
 =?utf-8?B?S2tzZVh3Z3N0RmxOQjY2MDNBV2pEUW8rNytXMDcvSnhYa2ZHT3hvYS8ydUw0?=
 =?utf-8?B?L0w3NDBRdWNWZmhoelZBQktaelJKQm5PemZRQjAwZGl2Y1FZU09BcVB2NU9s?=
 =?utf-8?B?eXIwcmtiT3FBa2I5ZmFoMXAxUFdhd2licTBKeTQ1am9HWHVKRXYyYjd5elhj?=
 =?utf-8?B?cmx4T3hhVGx1MWVpZEtqOE1ZZWRNamFGQkl6dzZ6N1RUWUxBRzBRb0ZUVy9N?=
 =?utf-8?B?bEVWVjdSbzdXdUNSSGdlRWxjVkdPbVp6eHJHbGNIS0ZEZ2Fma0hjci9FTzM2?=
 =?utf-8?B?V1IwK1dXam94VlpNZlNpUUNYSnFMeXlYcngyczE2WW5PekhXaDFPaUJaYUc5?=
 =?utf-8?B?eWZNMzNBWnlaN2hCVHBvWGIrRnRyYmoxb2ljOHEyR0VzSTdEOVlXSXh1TExN?=
 =?utf-8?B?SGNjTlhJM2xlaVVXUCsvaFRrZWNVTS9Ld0ltY2JEOExQTTIvVlJ1UlBGcGIx?=
 =?utf-8?B?K2YwWHZoS3NKNkowU0J2UTV3WGphNXc2QitsR0pVK0hwajQ1cW5WYndRazJG?=
 =?utf-8?B?ZGdnRENlK1A1V0JKbnEvRm9NVUx1bG5hVEkwU21UdlZIZCtMVUhKdEFnN0R6?=
 =?utf-8?Q?z237XojajTAgTwEI=3D?=
X-Exchange-RoutingPolicyChecked:
	hBAlN+mh6yFTuacLnyrJr1+LTGLTPPNMrt9sGD1NSN5uiGoAZV0zMWpnMD3Gi8vAzxmrDBeegzNcSvs+C0OV2pPTkwqtUeqzR2y5trLujS35hnLAXwTPuiRI21uJRIBVqAAmzIsMJTCWuf+XCBF6xL/oXjVBihov4XsxNuafjPaDyxMY38QIHlEdxpttbIWCLd5EvrdGOgX/Qw0rLhfMXUGUvMVQaGMXxOmaXIQuKn2xQ1AcPMmLIM9Grl73AvMmqN/6kmeX4jnk9MhbXs3axLLE9YooJhD5zk3zwtXc8XrTmofdAV+iuKbrWdAr6fwRJYa6j6VYojx0PPphhxH5aA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+witZxRvZ/67DzJCVczrf8rF9GxlX4JkWKhYdM6OumqxSopoKzXmlOoT2MLX3+ON1y2hwktTY4vUZF1SeZyZKkcagOqHKuDuFPBlbBp70AMSuQg3XM9ilKTPQGyhDEamec0i64kzG2+8ZqRTkdsU/l0E3JgWZWbmkDQKi8WawivbdQx6JFLNFL5Lqh9xWthVgXQsl/v6BnXY+ncwVj74lzLy04us5yGbtIIDRBBDTXNoAtmp3u4ys97jK+fsOUl+ioFjRIHUUiDPTt3aNSkCtaR3ZDI9prjBv7P2Zx7yO0oZhUTGtPtRxx9P3Xdp2OXmxlqYe2jkrXVLUjKLDt5kno2oc+fWgtPbbxGVIuRzbUEhAFWR5JOVXTfWCcZXKLm4cD5oXDJEjxDlk6dQGuSIopBsVRyMc2YFquSsKjlHpkD8cv9c6qvJLVY7eZwzCMzv9nu9jewZzX3kpf2EwYqcJLdIb5q8bXkgpEIEZ4xBn5HbkGXRZ1VfyPZvjMhbDGq/cMhzkN39Z/XYvTVxkp/PkK4m0C+1t45vSlFtuuDkFN0HHGO+RtzD/0QPKhKAxx3L7xjrBQeuyEI0Eb0B2CbfVYu9zPRq+idPzyjTSx/aYTg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d40fd54-0e21-42ce-cbbe-08df212a0df8
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 08:41:01.7523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bh0X/GPegPKTeBtALoiY8fbj6o/1WnwJA8jqJhiSJdGUlhf0ulYQnSGM2VDFDOFBpRiWGbHWjt+r50lnRsMEA0bsy11Mum5ii7eb/5+C6+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7680
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2610030034
X-Proofpoint-ORIG-GUID: J9fwjLktP3DirhjtF9yfXr88w21V0A3o
X-Authority-Analysis: v=2.4 cv=RIMmjIi+ c=1 sm=1 tr=0 ts=6ac0bfa1 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8
 a=qOJnSHoie1X2y-vyz_QA:9 a=QEXdDO2ut3YA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12108
X-Proofpoint-GUID: J9fwjLktP3DirhjtF9yfXr88w21V0A3o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfXzoRKIRxRV0X/
 2byt+Yrh+Ng4O5gWf5K2O9gL1rCVxj8jacQqGxBEmzrf0dUqCrqQmDP5VHjEqcqrbHycHEvQlG0
 WpuVBoEnQu0XLUqsFZGfktAfszdt/QDiMUT+hBfZbJMihieDu6Nh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfXxugvziPlqMQL
 IOhu4tDPuo4cPdK8CSNjcXspbQcUhfXIjEUTVqXR4N7wCFtl9YA6bLD4Hl9G3Le6mUEmJaxwtl/
 +99NcoBPL3LahCeSaas+LmbkEcoGy+vT9jEjPScvhEDtO8S5yhSNyc5eHkIIkMkDYslD5iKVpGJ
 r+sw69vGACGGy1he6FoEx1SygJbDICnqk85ZJUC0NkFZEAF32BtJqkQFv5XrTJt73Nk3BfMCRWc
 gyhbKu81oN5eHhLbp2z8AI/nWuGttLSMa9p1s3BWamjO1KT1D6D50/MY3EZ2C3DxfTqWSYN816Y
 3seZWKobUOHeZD1ah5ADjZK8qpWNXOd4L1Z4ICM5olEgONRiUqFMXRDAewpJykUZ89vdMgZ8HVn
 vIukgI+fHLrxwdZj4+KvM6VX0za0MWKr491OYbdv4xjYBuFTfatxAUXTTzCGd9GFtr2ilgSexrs
 o9EnZgCCiHP+/6+yQ9JCjcN6t0dF2OZgmWVGLFYA=

Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 9/28/26 12:02 PM, Kris Van Hees via DTrace-devel wrote:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libdtrace/dt_module.c                         | 50 ++++++++++++++-----
>  libdtrace/dt_parser.c                         | 34 ++++++++-----
>  test/triggers/Build                           |  3 ++
>  test/triggers/testprobe.c                     | 12 ++++-
>  .../err.D_IDENT_UNDEF.scope-dot-kernel.r      |  2 +-
>  .../lexer/err.D_IDENT_UNDEF.scope-dot.r       |  2 +-
>  ... err.D_IDENT_UNDEF.scope-kernel-as-user.d} |  0
>  .../err.D_IDENT_UNDEF.scope-kernel-as-user.r  |  2 +
>  ... err.D_IDENT_UNDEF.scope-user-as-kernel.d} |  0
>  .../err.D_IDENT_UNDEF.scope-user-as-kernel.r  |  2 +
>  .../err.D_IDENT_UNDEF.scope-user-missing.d    | 19 +++++++
>  .../err.D_IDENT_UNDEF.scope-user-missing.r    |  2 +
>  .../err.D_SYM_BADREF.scope-kernel-as-user.r   |  2 -
>  .../err.D_SYM_BADREF.scope-user-as-kernel.r   |  2 -
>  test/unittest/lexer/tst.scope-user-explicit.d |  2 +-
>  test/unittest/lexer/tst.scope-user-explicit.r |  0
>  .../lexer/tst.scope-user-path-empty.sh        | 27 ++++++++++
>  .../err.D_DECL_SCOPE.scopeop-enumerator.r     |  2 +-
>  test/unittest/types/tst.scope-user-dotted.r   |  0
>  test/unittest/types/tst.scope-user-dotted.sh  | 28 +++++++++++
>  test/unittest/types/tst.scope-user-types.d    | 24 +++++++++
>  test/unittest/types/tst.scope-user-types.r    |  0
>  22 files changed, 181 insertions(+), 34 deletions(-)
>  rename test/unittest/lexer/{err.D_SYM_BADREF.scope-kernel-as-user.d => err.D_IDENT_UNDEF.scope-kernel-as-user.d} (100%)
>  create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.r
>  rename test/unittest/lexer/{err.D_SYM_BADREF.scope-user-as-kernel.d => err.D_IDENT_UNDEF.scope-user-as-kernel.d} (100%)
>  create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.r
>  create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.d
>  create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.r
>  delete mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
>  delete mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
>  create mode 100644 test/unittest/lexer/tst.scope-user-explicit.r
>  create mode 100755 test/unittest/lexer/tst.scope-user-path-empty.sh
>  create mode 100644 test/unittest/types/tst.scope-user-dotted.r
>  create mode 100755 test/unittest/types/tst.scope-user-dotted.sh
>  create mode 100644 test/unittest/types/tst.scope-user-types.d
>  create mode 100644 test/unittest/types/tst.scope-user-types.r
> 
> diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> index acf4baa7..08dc0937 100644
> --- a/libdtrace/dt_module.c
> +++ b/libdtrace/dt_module.c
> @@ -71,6 +71,9 @@ dt_user_path_add(dtrace_hdl_t *dtp, dt_htab_t *h, char *s)
>  {
>  	dt_path_t	tmpl, *path;
>  
> +	if (s == NULL)
> +		return -1;
> +
>  	tmpl.str = s;
>  	if (dt_htab_lookup(h, &tmpl) != NULL) {
>  		free(s);
> @@ -88,6 +91,7 @@ dt_user_path_add(dtrace_hdl_t *dtp, dt_htab_t *h, char *s)
>  		goto fail;
>  	}
>  
> +	dt_dprintf("Adding user module path %s\n", path->str);
>  	dt_list_append(&dtp->dt_user_path, path);
>  
>  	return 0;
> @@ -109,14 +113,14 @@ dt_user_path_add_env(dtrace_hdl_t *dtp, dt_htab_t *h, const char *env)
>  	for (;;) {
>  		end = strchr(str, ':');
>  		if (end == NULL) {
> +			/*
> +			 * A trailing empty path component denotes the current
> +			 * directory.
> +			 */
>  			if (*str == '\0')
> -				if (dt_user_path_add(dtp, h, strdup(".")) == -1)
> -					return -1;
> -
> -			if (dt_user_path_add(dtp, h, strdup(str)) == -1)
> -				return -1;
> +				return dt_user_path_add(dtp, h, strdup("."));
>  
> -			break;
> +			return dt_user_path_add(dtp, h, strdup(str));
>  		}
>  
>  		if (end == str) {
> @@ -142,14 +146,19 @@ dt_user_path_init(dtrace_hdl_t *dtp)
>  	char		*str, *end;
>  	int		rc = 0;
>  
> +	if (h == NULL)
> +		goto fail;
> +
>  	/* Add paths from $LD_LIBRARY_PATH. */
>  	if (dt_user_path_add_env(dtp, h, "LD_LIBRARY_PATH") != 0)
>  		goto fail;
>  
>  	/* Add paths from ld.so.cache (using ldconfig -p output). */
>  	fp = popen("/sbin/ldconfig -p", "r");
> -	if (fp == NULL)
> -		goto fail;
> +	if (fp == NULL) {
> +		dt_dprintf("Failed to get paths from ldconfig\n");
> +		goto path;
> +	}
>  
>  	while (getline(&buf, &len, fp) != -1) {
>  		/* We are interested in lines like: <something> => /path */
> @@ -182,6 +191,7 @@ dt_user_path_init(dtrace_hdl_t *dtp)
>  	if (rc == -1)
>  		goto fail;
>  
> +path:
>  	/* Add paths from $PATH. */
>  	if (dt_user_path_add_env(dtp, h, "PATH") != 0)
>  		goto fail;
> @@ -195,6 +205,8 @@ dt_user_path_init(dtrace_hdl_t *dtp)
>  
>  fail:
>  	dt_htab_destroy(h);
> +	dt_user_path_destroy(dtp);
> +	dt_set_errno(dtp, ENOMEM);
>  	return -1;
>  }
>  
> @@ -328,6 +340,8 @@ dt_module_create(dtrace_hdl_t *dtp, const char *name)
>  		dmp->dm_ops = &dt_modops_32;
>  	dmp->dm_dtp = dtp;
>  
> +	dt_dprintf("created module %s\n", dmp->dm_name);
> +
>  	return dmp;
>  }
>  
> @@ -341,14 +355,16 @@ dt_module_create_user(dtrace_hdl_t *dtp, const char *name)
>  {
>  	dt_module_t	*dmp;
>  	char		*file = NULL;
> +	char		*p;
>  
>  	if (name == NULL || name[0] == '\0') {
>  		dt_set_errno(dtp, EINVAL);
>  		return NULL;
>  	}
>  
> -	if (dt_list_empty(&dtp->dt_user_path))
> -		dt_user_path_init(dtp);
> +	if (dt_list_empty(&dtp->dt_user_path) && dt_user_path_init(dtp) == -1)
> +		return NULL;
> +
>  	if (!dt_list_empty(&dtp->dt_user_path)) {
>  		dt_path_t	*path;
>  
> @@ -366,11 +382,19 @@ dt_module_create_user(dtrace_hdl_t *dtp, const char *name)
>  		}
>  
>  		if (file == NULL) {
> -			dt_set_errno(dtp, ENOENT);
> +			dt_set_errno(dtp, EDT_NOMOD);
>  			return NULL;
>  		}
>  	}
>  
> +	/*
> +	 * Use the resolved pathname as the object location, but name it based
> +	 * on just the filename.
> +	 */
> +	p = strrchr(name, '/');
> +	if (p != NULL)
> +		name = p + 1;
> +
>  	if (strlen(name) >= DTRACE_MODNAMELEN ||
>  	    strlen(file) >= sizeof(dmp->dm_file)) {
>  		dt_set_errno(dtp, ENAMETOOLONG);
> @@ -437,7 +461,7 @@ dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
>  	if (dmp->dm_file[0] == '\0') {
>  		dt_dprintf("failed to open ELF file for module %s: "
>  		    "no file name known\n", dmp->dm_name);
> -		return dt_set_errno(dtp, EDT_NOTLOADED);
> +		return dt_set_errno(dtp, EDT_NOMOD);
>  	}
>  
>  	if ((fd = open(dmp->dm_file, O_RDONLY)) == -1) {
> @@ -496,7 +520,7 @@ dt_module_load_sect(dtrace_hdl_t *dtp, dt_module_t *dmp, ctf_sect_t *ctsp)
>  	Elf_Scn *sp;
>  
>  	if (elf_getshdrstrndx(dmp->dm_elf, &shstrs) == -1)
> -		return dt_set_errno(dtp, EDT_NOTLOADED);
> +		return dt_set_errno(dtp, EDT_NOMOD);
>  
>  	for (sp = NULL; (sp = elf_nextscn(dmp->dm_elf, sp)) != NULL; ) {
>  		if (gelf_getshdr(sp, &sh) == NULL || sh.sh_type == SHT_NULL ||
> diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
> index 1fd0f5b4..1eccc0fd 100644
> --- a/libdtrace/dt_parser.c
> +++ b/libdtrace/dt_parser.c
> @@ -257,6 +257,14 @@ dt_type_lookup(const char *s, dtrace_typeinfo_t *tip)
>  		memcpy(type, s, (size_t)(start - s));
>  		memcpy(type + (size_t)(start - s), ident, strlen(ident) + 1);
>  
> +		if (scopekind == 2 && obj != DTRACE_OBJ_UMODS) {
> +			dt_module_t *dmp = dt_module_create_user(dtp, obj);
> +
> +			if (dmp == NULL)
> +				return -1;
> +			obj = dmp->dm_name;
> +		}
> +
>  		return dtrace_lookup_by_type(dtp, obj, type, tip);
>  	}
>  
> @@ -2832,17 +2840,14 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
>  	 * scope is desired and we should search the specified idhash.
>  	 */
>  	scopekind = dt_scope_parse(dnp->dn_string, &scope, &ident);
> -	if (scopekind < 0) {
> -		xyerror(D_SYNTAX, "syntax error near \"%s\"\n",
> -		    dnp->dn_string);
> -	}
> +	if (scopekind < 0)
> +		xyerror(D_SYNTAX, "syntax error near \"%s\"\n", dnp->dn_string);
>  
>  	if (scopekind > 0) {
>  		uref = scopekind == 2;
>  		name = (char *)ident;
>  		*(char *)(ident - scopekind) = '\0';
>  		dnkind = DT_NODE_VAR;
> -
>  	} else if (idkind == DT_IDENT_AGG) {
>  		scope = DTRACE_OBJ_EXEC;
>  		name = dnp->dn_string + 1;
> @@ -2862,6 +2867,17 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
>  	dt_set_errno(dtp, EDT_NOVAR);
>  	markstr = uref ? "``" : "`";
>  
> +	if (uref && scope != DTRACE_OBJ_UMODS) {
> +		dt_module_t *dmp = dt_module_create_user(dtp, scope);
> +
> +		if (dmp == NULL) {
> +			xyerror(D_IDENT_UNDEF, "failed to resolve %s%s%s: %s\n",
> +			    dnp->dn_string, markstr, name,
> +			    dtrace_errmsg(dtp, dtrace_errno(dtp)));
> +		}
> +		scope = dmp->dm_name;
> +	}
> +
>  	if (scope == DTRACE_OBJ_EXEC && (
>  	    (dhp != dtp->dt_globals &&
>  	    (idp = dt_idhash_lookup(dhp, name)) != NULL) ||
> @@ -2925,14 +2941,11 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
>  			dt_cook_taint_alloca(dnp, idp, NULL);
>  
>  		dt_node_attr_assign(dnp, attr);
> -
>  	} else if (dhp == dtp->dt_globals && scope != DTRACE_OBJ_EXEC &&
>  	    dtrace_lookup_by_name(dtp, scope, name, &sym, &dts) == 0) {
> -
>  		dt_module_t *mp = dt_module_lookup_by_name(dtp, dts.object);
>  		int umod = (mp->dm_flags & DT_DM_KERNEL) == 0;
>  		static const char *const kunames[] = { "kernel", "user" };
> -
>  		dtrace_typeinfo_t dtt;
>  		dtrace_syminfo_t *sip;
>  
> @@ -2992,7 +3005,6 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
>  			idp->di_flags |= DT_IDFLG_USER;
>  			dnp->dn_flags |= DT_NF_USERLAND;
>  		}
> -
>  	} else if (scope == DTRACE_OBJ_EXEC && create == B_TRUE) {
>  		uint_t flags = DT_IDFLG_WRITE;
>  		uint_t id;
> @@ -3061,15 +3073,13 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
>  			dt_cook_taint_alloca(dnp, idp, NULL);
>  
>  		dt_node_attr_assign(dnp, attr);
> -
>  	} else if (scope != DTRACE_OBJ_EXEC) {
>  		xyerror(D_IDENT_UNDEF, "failed to resolve %s%s%s: %s\n",
>  		    dnp->dn_string, markstr, name,
>  		    dtrace_errmsg(dtp, dtrace_errno(dtp)));
> -	} else {
> +	} else
>  		xyerror(D_IDENT_UNDEF, "failed to resolve %s: %s\n",
>  		    dnp->dn_string, dtrace_errmsg(dtp, dtrace_errno(dtp)));
> -	}
>  }
>  
>  static dt_node_t *
> diff --git a/test/triggers/Build b/test/triggers/Build
> index 4ff5002a..98556586 100644
> --- a/test/triggers/Build
> +++ b/test/triggers/Build
> @@ -106,6 +106,9 @@ proc-tst-omp_LDFLAGS := -fopenmp
>  proc-tst-pthread-exec_CFLAGS := -pthread
>  proc-tst-pthread-exec_LIBS := -pthread
>  
> +# Userspace scoped-type tests need type information in this executable.
> +testprobe_CFLAGS := -gctf
> +
>  # readwholedir is used for ustack() tests, so needs a symbol table and needs
>  # all its functions in it, even if they would be sibcalled out of existence.
>  readwholedir_CFLAGS := -fno-inline -fno-optimize-sibling-calls
> diff --git a/test/triggers/testprobe.c b/test/triggers/testprobe.c
> index 4bef92fe..22546ddf 100644
> --- a/test/triggers/testprobe.c
> +++ b/test/triggers/testprobe.c
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2005, 2012, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2005, 2012, 2026, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -17,10 +17,20 @@
>  #include <stdio.h>
>  #include <unistd.h>
>  
> +/* Keep a named type in the executable's CTF for userspace type-lookup tests. */
> +struct dtrace_scope_test_type {
> +    int value;
> +};
> +
> +static struct dtrace_scope_test_type dtrace_scope_test_instance;
> +
>  int main(int argc, char *argv[])
>  {
>      int fd, i;
>  
> +    /* Prevent optimization from discarding the test type. */
> +    dtrace_scope_test_instance.value = argc;
> +
>      if ((fd = open("/dev/dtrace/provider/dt_test", O_RDONLY)) == -1) {
>          perror("open");
>          exit(1);
> diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
> index 89a9f9c5..926e5a91 100644
> --- a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
> +++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
> @@ -1,2 +1,2 @@
>  -- @@stderr --
> -dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar`baz: Module is no longer loaded
> +dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar`baz: Unknown module name
> diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
> index 7734e29f..42a6ea95 100644
> --- a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
> +++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
> @@ -1,2 +1,2 @@
>  -- @@stderr --
> -dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar``baz: Module is no longer loaded
> +dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar``baz: Unknown module name
> diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.d
> similarity index 100%
> rename from test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
> rename to test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.d
> diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.r
> new file mode 100644
> index 00000000..3299b3c3
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.d: [D_IDENT_UNDEF] line 16: failed to resolve vmlinux``major_names: Unknown module name
> diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.d
> similarity index 100%
> rename from test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
> rename to test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.d
> diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.r
> new file mode 100644
> index 00000000..b952b509
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.d: [D_IDENT_UNDEF] line 18: failed to resolve testprobe`main: Unknown module name
> diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.d b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.d
> new file mode 100644
> index 00000000..7304da72
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: An explicitly-scoped userspace symbol reports a lookup error
> + * when its module cannot be found.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(no_such_module``main);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.r
> new file mode 100644
> index 00000000..3e752fc9
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.d: [D_IDENT_UNDEF] line 17: failed to resolve no_such_module``main: Unknown module name
> diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
> deleted file mode 100644
> index 718b2b31..00000000
> --- a/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
> +++ /dev/null
> @@ -1,2 +0,0 @@
> --- @@stderr --
> -dtrace: failed to compile script test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d: [D_SYM_BADREF] line 16: kernel module 'vmlinux' symbol 'major_names' may not be referenced as a user symbol
> diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
> deleted file mode 100644
> index 87169597..00000000
> --- a/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
> +++ /dev/null
> @@ -1,2 +0,0 @@
> --- @@stderr --
> -dtrace: failed to compile script test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d: [D_SYM_BADREF] line 18: user module 'testprobe' symbol 'main' may not be referenced as a kernel symbol
> diff --git a/test/unittest/lexer/tst.scope-user-explicit.d b/test/unittest/lexer/tst.scope-user-explicit.d
> index 2d649f6f..daead7b3 100644
> --- a/test/unittest/lexer/tst.scope-user-explicit.d
> +++ b/test/unittest/lexer/tst.scope-user-explicit.d
> @@ -6,7 +6,7 @@
>   */
>  
>  /* @@trigger: testprobe */
> -/* @@runtest-opts: -e */
> +/* @@runtest-opts: -e -xlinkmode=static */
>  
>  /*
>   * ASSERTION: Explicit userspace module scoping resolves as a userspace
> diff --git a/test/unittest/lexer/tst.scope-user-explicit.r b/test/unittest/lexer/tst.scope-user-explicit.r
> new file mode 100644
> index 00000000..e69de29b
> diff --git a/test/unittest/lexer/tst.scope-user-path-empty.sh b/test/unittest/lexer/tst.scope-user-path-empty.sh
> new file mode 100755
> index 00000000..00502578
> --- /dev/null
> +++ b/test/unittest/lexer/tst.scope-user-path-empty.sh
> @@ -0,0 +1,27 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +#
> +# ASSERTION: An empty trailing entry in PATH or LD_LIBRARY_PATH denotes the
> +# current directory when resolving a userspace module.
> +#
> +
> +dtrace=$1
> +dir=$tmpdir/scope-user-path-empty.$$
> +
> +mkdir -p "$dir" || exit 1
> +trap 'rm -rf "$dir"' EXIT
> +cp test/triggers/testprobe "$dir/testprobe" || exit 1
> +cd "$dir" || exit 1
> +
> +PATH=.: LD_LIBRARY_PATH=.: "$dtrace" $dt_flags -e -c testprobe -n '
> +BEGIN
> +{
> +	trace(&testprobe``main);
> +	exit(0);
> +}'
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
> index 06ef912b..48ee9b20 100644
> --- a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
> @@ -1,2 +1,2 @@
>  -- @@stderr --
> -dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d: [D_DECL_SCOPE] line 15: D scoping operator may not be used in an enumerator name (foo`bar)
> +dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d: [D_DECL_SCOPE] line 16: D scoping operator may not be used in an enumerator name (foo`bar)
> diff --git a/test/unittest/types/tst.scope-user-dotted.r b/test/unittest/types/tst.scope-user-dotted.r
> new file mode 100644
> index 00000000..e69de29b
> diff --git a/test/unittest/types/tst.scope-user-dotted.sh b/test/unittest/types/tst.scope-user-dotted.sh
> new file mode 100755
> index 00000000..3d0348b7
> --- /dev/null
> +++ b/test/unittest/types/tst.scope-user-dotted.sh
> @@ -0,0 +1,28 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +#
> +# ASSERTION: A dotted userspace module name resolves both external symbols
> +# and types.
> +#
> +
> +dtrace=$1
> +dir=$tmpdir/scope-user-dotted.$$
> +
> +mkdir -p "$dir" || exit 1
> +trap 'rm -rf "$dir"' EXIT
> +cp test/triggers/testprobe "$dir/scope.user" || exit 1
> +cd "$dir" || exit 1
> +
> +PATH=.: "$dtrace" $dt_flags -e -xlinkmode=static -c scope.user -n '
> +BEGIN
> +{
> +	symbol = &scope.user``main;
> +	type = (struct scope.user``dtrace_scope_test_type *)NULL;
> +	exit(0);
> +}'
> diff --git a/test/unittest/types/tst.scope-user-types.d b/test/unittest/types/tst.scope-user-types.d
> new file mode 100644
> index 00000000..380af340
> --- /dev/null
> +++ b/test/unittest/types/tst.scope-user-types.d
> @@ -0,0 +1,24 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: testprobe */
> +/* @@runtest-opts: -e -xlinkmode=static */
> +
> +/*
> + * ASSERTION: Explicit and implicit userspace type scopes, and the implicit
> + * kernel type scope, resolve external types.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	scope_explicit = (struct testprobe``dtrace_scope_test_type *)NULL;
> +	scope_implicit = (struct ``dtrace_scope_test_type *)NULL;
> +	scope_kernel = (struct `task_struct *)NULL;
> +	exit(0);
> +}
> diff --git a/test/unittest/types/tst.scope-user-types.r b/test/unittest/types/tst.scope-user-types.r
> new file mode 100644
> index 00000000..e69de29b
> -- 
> 2.52.0
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 

