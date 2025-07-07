Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82F818A6DF
	for <dtrace@lists.linux.dev>; Mon,  7 Jul 2025 16:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751905968; cv=fail; b=IUi5cNun8AWLZXxcZ/y+L4rrNhPtUnmzKVOlgd5dusT3N4fSfZDrXJW+l7dbRkS5EL1wsiLksoFfx5tozf+/XzxFb3IEQdV9K4yDY0lk5ue7Wpnc+TpQtQOgfWcie5LvRqFELt2oFUf4Ccr3A8Hah8jALZbzb8Qj7zvun/jDlIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751905968; c=relaxed/simple;
	bh=bsrQHjoJD3PIrx0hGDWn+H82Tu3fGYQUcBk2vDGNhUk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GzVXeC6dJIJhVGoibi/3cfkkPklvhFqLdvsT/WNSlahByBW+Dyhfham1UIB4F8hCNmRJS1dAAfLf7iF0uMFgaJpkp9OkuW3DbvWKBIekcjtChjzNskx8OllzRG9c7PBOxdVUnCpJqOox5Hbgna3dQ9nsFNGDBumPcG8RZA9odUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DkembCBX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=u6sNLHfw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DkembCBX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="u6sNLHfw"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567GWF77011668
	for <dtrace@lists.linux.dev>; Mon, 7 Jul 2025 16:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=YvMCSGv1ra6hvRko6Wuk+gtjYFKYOMmniN3V7vBWnYg=; b=
	DkembCBXay9h1J4Oe10H8Dx4QXhpaDYWQlStUUy4qhsmWaCLsj5nNWSeCOzAZnlA
	Qoqjg83C9e+qKDF5ulEh4Xb/MTdDeXuCqlEdHM+zqddu+/cmjBlMQmQWldUZL7ZS
	QUsxjH91m5QhpP/BHyIzOsyCFJ+zHmevNWxSFT5yY3mML+PONxRWjtcTwStiwdKW
	gkxo7UeqJo/dY7PXvnsK41ep/uXhQrxCH5C+sx88/N75RK5NLU4yJrkZ5xKONINc
	bEUckwnJbxgiz/nM6uGcsD3uf04BLuRukaQM6ujUyBQr8b1xMN8C+rO+DcJttrfl
	qWzQ1ynMc1xkXzQG1owgRA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47rhu9g01k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Jul 2025 16:32:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 567EnVZT040415
	for <dtrace@lists.linux.dev>; Mon, 7 Jul 2025 16:32:43 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg8qekb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Jul 2025 16:32:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADUQgOc7jxIB9aN68V8xPNAx/7MEz7nzvNea3LkC++etDfaNbgQV7uPlYSaXLousNDMwzw9bnxZYfMYqNBmk1PCI0/IvLJyTo7kbS1TEpK0hB064aw/1SQjeyZsmxSX/GM81XiFq1U27+oPENQzDB5+KgLs5WOiOh34P9YPeSHEwD/k1HXFBQbnr/9mIY1QmJK9auHZP6Kw9qDNSJDD3JtPBhfAVciLrvgTCtxATKbF3RYd7/s4bQFyOqswgGJXNP/lGwrM4I7b19vwjzr1ScRcSLIAR1C0Ji9Al8TdYExuuKoP0m71THcvUN5VsJ2i9fNJnc+yX/6n90q0jT8J+hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvMCSGv1ra6hvRko6Wuk+gtjYFKYOMmniN3V7vBWnYg=;
 b=WaP3Ns7yGnNUrAUCUoEDHrEdCpcv82r7tQtHwAZwkDaIuXYVFVGY4LoduNNDAptIcSsVz2SrUi7eAsOgJ5jklQDbYBkhwMSvBMt+Ep1brQfPkkTfDk2xZ0tWv/OpIVsRC2KoiuJbrZa1W97BecdSI5nZ03m0K3Ys8Af+exvE88cvfnDhnY9HGpVek9HOjTee+TmZseKZTirfUHI44UkdQx6ZETWyuXDehE4BokplE8AU3kfoKQ+IaVRiGXspRNWIcQBQpRB728/KINaijel2RwVfqP4C54u47Td6DXWFNTAhzvRGbUBS/1PVhDClKMIn2p3d2ictRtkEzm/SPladoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvMCSGv1ra6hvRko6Wuk+gtjYFKYOMmniN3V7vBWnYg=;
 b=u6sNLHfwBAxLiUWxci7a9KWSmxTMx9+im0pRjmhQocBXMQY3lu58oi+jqL9wBY+HD/S5/ncV1EpzRXjzNWhKzw7vyYZj1FjJlMmNqzdVTjg0cWH4PjvsBT8ZYyHuoos50VQiHERD1oGDwh/bhK/xLCmtErf/clCmpfHkgCZIgFI=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 DM4PR10MB6911.namprd10.prod.outlook.com (2603:10b6:8:101::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.28; Mon, 7 Jul 2025 16:32:29 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 16:32:27 +0000
Message-ID: <21b12943-a166-41f4-8f30-8bb44e12317a@oracle.com>
Date: Mon, 7 Jul 2025 17:32:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20250703113345.1273604-1-alan.maguire@oracle.com>
 <e660b225-4a3c-209f-fae4-8831f6c3229c@oracle.com>
 <08bae006-f438-4134-a811-609b3fda69d1@oracle.com>
 <afbb9858-e5a7-6d76-a6c2-23b46d8660df@oracle.com>
 <58cb8219-337e-42ed-ae17-1c4e77894a9c@oracle.com>
 <aGbLTOzqILN+3J93@oracle.com>
 <a2f593f6-38d6-4a8d-8d42-4bdb6b9ac14f@oracle.com>
 <aGbT+p0DjRTFl7Oc@oracle.com>
 <077a08c1-e999-4782-9269-62a269d76f65@oracle.com>
 <aGbvQAmqsLA5+LaH@oracle.com> <aGcF67vQ8M942gh0@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aGcF67vQ8M942gh0@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0015.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::14) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|DM4PR10MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 9194e6f1-4cd9-4768-ce2b-08ddbd73dc4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTBvVkxzQTN3SHhEZDRpeXFCVWxwWnZiSlF5ak9La3A2dHo3K25yenJPZGtw?=
 =?utf-8?B?RzNqa3ZTMXl4L3pGMitkbWttWjdZYVRiYmMvUmdNZ0kwNjhVTG1lQVJxVyt2?=
 =?utf-8?B?NjlscjhTZWNrN1prY216NE9Ma3JwVFVnMGhYcTJqZDFQRVg2bUdOYndwaVVh?=
 =?utf-8?B?bTR3VEJjVHpCU05LRVFtZWVXT2tUekt1eE9rb2NndFdhWXRJSWpPbEt3YnJ2?=
 =?utf-8?B?SjZuRjh6RXQ0aHE1T1VDUWF3N0NsQ1N1ZFl6R0xwbWJqVzlDYmdGYUE3dFdn?=
 =?utf-8?B?aVNuRXRSRU5NaVZZRUJTWW9xY3VSWVp5M3A2Vlk3WWMvaHdZakZiZnMxT1lR?=
 =?utf-8?B?TXduSXB3RHBKNjBsK3pzSDlLbGM3dkRadW9yZGNxZEZkbGdjL3hFa2RJTDM1?=
 =?utf-8?B?R0JlZGpreTJqTkc0NkFhdVpNeDZrc1dGU0tXdlM2VDU1N1pWU3ZBTVhJUHhT?=
 =?utf-8?B?WjhaU0tkTng5ci9WRjhoUGxjbXBUN3JLZFFMMTRGbzJLbWtmOFZONkN0MlJ2?=
 =?utf-8?B?Y01maTk3a2IrYlJIa0F0cmxtMnQ3YlVJV0c5NG1ZSU1Lc3VUbHVUOTF6S2R2?=
 =?utf-8?B?UmFuNnRzRTNLL2VrUVlNQllLY3RRczhhZEJXN0dDZzdJQnYvaUszL2JvZnlZ?=
 =?utf-8?B?eEpyNFFEck5IbHEyNkxtOENMbUZhdE55VkN3WnNVcDBPMnNxUEFxRStEUGNR?=
 =?utf-8?B?UW5mRkZnd0Zua1B3bHlaWEM4dGdwRmdQT0VudTR6SlRST0I4R1lacnlIWnI1?=
 =?utf-8?B?WFdpNjFZUzBEeElFZDJDb1NiRGIxTlAyYW1UOHgvanJUMkorSldYOXprUkNy?=
 =?utf-8?B?VmE3VmNSWHVadU91Q0M1ZlpiSmZKK1pwaW8wdlJXOTRDQ1hsTVNjZk5wMUh3?=
 =?utf-8?B?NVB5dlEyYzJKc1Z6Zi96eHB2dGc5WHNVVTFwS2tCSmJzd2FXMk8xQXBwcVpC?=
 =?utf-8?B?UWVEdkZYUzFxbWtUcTZHK1JGR1RTRDBmc3hXUS93SllGMTFydjlLUHNDMmEw?=
 =?utf-8?B?REhkdXNrakNDRVNVZ2NSV0lOSEhvNUhjbWNhZk4rTTZJWXZaaTFycHZXa3Iz?=
 =?utf-8?B?WktJZ2ovZEVmSnZ2aHg4SjBIT2dWbUM4dFdjVGlNN2gydDE4b0lGdnlOSCtl?=
 =?utf-8?B?eVVQdC9WUzdPcEpRSXJ0M1BaODBDbkIzckNGSW1xNS8ra0pRN3EzaWRtZ001?=
 =?utf-8?B?RHJ4RlExMlZyOW1FbEZuSXozU1QxRkg4UDhYaTRUK3RCd3R0T0FOcWxKS0RN?=
 =?utf-8?B?cUJFQTR2L3RIWVBIaDR6Ny9aRjNvYTRQY0J0WXdtZUJqb1dZMW9oOXYzTExM?=
 =?utf-8?B?eStTMTNLMEhlMW1zS25pemdvT3lXZnZtdE5vR2RRRWJIaVZCck0wbkNkWW02?=
 =?utf-8?B?WEV1TXNqVit1MjhrQ3dRSUFKb1dMUGZBY1orN3FNSU90Y3BIa0ZJbk1paStQ?=
 =?utf-8?B?eElGNGZlZUJlWHB5SUhub1dtMm5JellkVU53UDdLSmpzam9PM3ZkdjhFR0pi?=
 =?utf-8?B?REpIOVdWU2ZYYWZ4VHFXV3JIcitWQUE3YlZVTGNqSVFnd3dvWUNNN1V0SjZQ?=
 =?utf-8?B?T3QxSm5aZEg0RGd6QVhYenBEcHVHdkNKOFJrcm1TS3JxVkYvaHdoTVd1Wi9Z?=
 =?utf-8?B?a3hsRitwS2VoS1JRT2IxZ3I3eGRzdGFPeEtTa0tmcTZPNlhlb1BzZHd5aFg4?=
 =?utf-8?B?bmJRRTZQSSs2SEl6UE9lVHdxNmI5V1dLNnVHWUxCVXFTKzhHL3ZINzJJL211?=
 =?utf-8?B?VDdaTnNuRWI2SVByZmpyRU9lZVdzYXdHNlRFc09HWFNoQTh4cjBkMmM5SUtG?=
 =?utf-8?B?WjlQNTE5dkczTUl2L3Z3VDlKTVJTbDJ1RmRZMFhoRW1CTDJ1a0N3YTg5NHdL?=
 =?utf-8?B?ei91WTVETU1IQllFRWZXUi9lcy9ndlFlQ25FVllVcGUwTXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0FuWWoxMnhCV3hoZFIrSmlTNllyOFozOWhiWC9wc2Q2SEZzNC9ycmZReGZP?=
 =?utf-8?B?Y1I4cXdwenBkZTBNRVpHTjVqY2xPOTBEbUhISjlZQVQ5Q1RSb2JMdThtMmd2?=
 =?utf-8?B?akNQU3NhVVQ3WWNwUnJVaXp2WUk5R0p6TjVrczRTK1lZSGFDRjRnT2FSMVRY?=
 =?utf-8?B?YWdUNzdyaVFJbWhtV1VaQUNTMVIxckZMdHpGUUFueGI3ZjFjUWx2cFdITjdC?=
 =?utf-8?B?bWZwRlhqcElQZkNkYllvcE92OW5kQlFwR0JROTJ5TGtZMmxwUEFBVGZ0SG1y?=
 =?utf-8?B?V3oxV0VkSUpRQVFhMUlMcDB1citRWERoc21xUTk5RGoxc0N6aUxWQXdNS0tY?=
 =?utf-8?B?MFFyYWJWY0xTTWtZeThXYU1KSEg5UnlwT1NUL1hWVDdCQTlaUTc0djBPWmFz?=
 =?utf-8?B?ZzJSKy9XWSs4L0NGaWZ6VDRwNjhkSE5abFd1RVByMnBtWXpQWXY3NnBOUjF1?=
 =?utf-8?B?Wk9kWm42Z2s3SmdRYkw5Mi9rL1c2K3VZeEx4UjByck4zaER6ZDJmZ2czWTNq?=
 =?utf-8?B?b1NlbmwrV0tidkNXSUV3aGpEeTJjY2E3K1hwaEhkczB6NDhxYTlaY3FhWjZK?=
 =?utf-8?B?a2VYSXJkanpvZ1RhdXFvZmcwY09sMjR4d2pRRWlNSFVyNHdxSUJWenloOFox?=
 =?utf-8?B?bm5MWHNnY2dyZVFrRGdzRXVtcEdISmwvMzREdkN3bzdxQ1Y2eHhTYnQ3SU45?=
 =?utf-8?B?Rk1XUmlVZ2xhRWhuUkUrWi96dGNzQW5EL0kzTjBDTkphWC8raTBsTkRVN3RG?=
 =?utf-8?B?QmlxTS9YclZCWDlHM1ppM2tzeGVLUWVlRzNENlpxc1BqMXNBVkNpUUlKaW9X?=
 =?utf-8?B?OXpUbUdCMDlFSFZrTWZpbnNTQnhHK0xGZTVJQmYwejRhZ0x1dUN1Ymx3NS9B?=
 =?utf-8?B?SWpBZXZlcmN4cjlLcWlxSU5EZmVJYXkzUVJvb3VCZ1A1UkZ3ZUU2emlGNmo2?=
 =?utf-8?B?WFF0dlk1Y3BuclRGT2ZaWm1OcExNa0FHeElHSVAxM3hVUWQwSzBUM0ZaY1Ji?=
 =?utf-8?B?Y1ROb2YycDZNL2dERWdtcVF3anZoOUJLUFY5ZnVhM0RZOWhHM0w1K1JqSkNF?=
 =?utf-8?B?Sml2RnVMYW51MVlVVDZvT1NHNUtVRVR5QjQ4K01SMXZDTzRqNTRVR3p4OWVU?=
 =?utf-8?B?cndkckZYaTh1TkVZaUFQMmQ0OTRmdzN6NmRUM3FVOVNld3lXVkc4UXB0YnZC?=
 =?utf-8?B?NG4ya0tEQ1VqR2dpYUN6Q29wN0RidWZWSDFvbGR3U2g0VXp3OTlIVW5objVl?=
 =?utf-8?B?SFVaVU4wZXMrNWlrR01oNHArUVQwOTU2eXdkUGxpam51WjQwTlBEdlVieC9J?=
 =?utf-8?B?cWNIQ1lOMlRSYVoyWWNRMGJDUWFKWURVcXFOaVJybU1tYzZwaWd6U1RuN1U3?=
 =?utf-8?B?UmVxdUV0OHZlc1JNQWtuWDJ1K29hM0pTME1KbDN5c1dSTXVrc3pYQzhMd3hE?=
 =?utf-8?B?aHFyQnhwZm5oeGhnU1N1T1ZTbW9EWjRPZ1NzUmMxRFBCVEVBSCthVnpaYURj?=
 =?utf-8?B?VWFWS1Awd25pTFJmWG0yQXpBVWNNWFVxS3B4YThUK0pYeXRGbStTMy9nM3J6?=
 =?utf-8?B?MTZqUGw0T0FUKzRXM0J2Rm9UVGg5eTJLb3V1Zk1YRGxzc0NvNFlYWW1BU1ps?=
 =?utf-8?B?aFFkVkM3Mjk5d0pybG9lQ3QzbFcwNHNkT0FCZ1M3NlJzV2lOZ2orMVNianVQ?=
 =?utf-8?B?Z2YwUkhvU1gvYnljb0dBbFRta1ZNeVdmVVFRN3FKeURoT25TSkZuZzVxUGpM?=
 =?utf-8?B?RE5GSzk3U3Q2OU9vUjg4SFlTU3NnQWQ4WE9ralBhM1RzM0xjakk1WmdrdzNX?=
 =?utf-8?B?a0dnV1djbFZxV08weHZUZHVNTmhNeUQvbUV3ZjRma0pYTjhaU3B1Q1V0U3pv?=
 =?utf-8?B?SUJmbytPR2xmOTJ2cEtOdS9kWTBtcTdzMVdRVXZMUjBNeEVzVTBjWEFSNG1p?=
 =?utf-8?B?Yk1PalVhcDBzQklSdzdXRmNTQ1hLL01RNGk2N0liOEFVNmo4VVBPYmNlTC9h?=
 =?utf-8?B?L0RHKzFoN0FHalkwamJUVVhlRW1RMkVTZmp1UXFGNjZEVEZ4U1luMzN5QzNn?=
 =?utf-8?B?cG03bUZCMFoxeFVnLzJNYm02OTFsNUtGNUZMV0FlL2owN1UzbmF0UHFtR0Uv?=
 =?utf-8?B?LzZUUU50RzZOM3VWWVZPL3BBanZobmJzazQyMGhxbjA5YnVBVTIrdWdEZW91?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9BGpCHFmkQAZ+LuSc4sFfedhIaVARa6shEGQLwG8KGL+ZDVsPbOgvj+hnhQNQxUdLnuHyI2no7ElwmaKr3JJFgtPmEUh3115KKynubIu/elDP85TheWtMboQ1kbumrVYh/GtctDRr0JE0iU0GO0pax/nkjfuIYL4NHZwwxjebFB5oJTYXm9hWyewF0uJ2WIps5j6AEHj80rMw01OwAGHXgfCuaQRWkHyXVRnATBx1BIwdIe0Y63qocYwhOz4Ut62vkNxxd7uYwioTE3PqIvHbMx3NPcnduu2noqk9eLeeYuJJaA24nTvCfclxyxuooN09gulNob2RKvON8Nw97sQ7FW6Pu2Y8TMPK0Xjoik+AH1W0mwEJTp7hUxPUGs0jM6gmW4JqOxUZDbmHdnGwOAP7ozmKBjCKu0voj6s+3dWGqF/rE0HlClPJp4bgBGJHTBxpVoORZhiz6z9n2lAzZM5ixNtD93JqKWyudN1S2ZPuwK4jmkJsOn0fsScYT4VRNWhqvD+4uKkThFGRbdVgliSCCfCfBWS9Savk9WdGNecjp7booHn5pjWtMap6x+aUBCflwDY1Eg7Fho7914GRajFD0dbEAaV9zLkZActDUx0vnU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9194e6f1-4cd9-4768-ce2b-08ddbd73dc4c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 16:32:27.3324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfHpGtJ7zE/DFpj4WpU7n4lBlGjyeZ/01yPS6zORrAIfpLEIj9tUtPVi7IGVC7DUwXx6HMkkf+Haxeh7jAISEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6911
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507070102
X-Proofpoint-GUID: cMoFMrUWQxRxcwzC_8T9nqy6W0IfuV_x
X-Authority-Analysis: v=2.4 cv=IeqHWXqa c=1 sm=1 tr=0 ts=686bf6ac cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=QnAdBYV3604ISsoF8YkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: cMoFMrUWQxRxcwzC_8T9nqy6W0IfuV_x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDEwMyBTYWx0ZWRfX8nkY1RsKcFgi SXh9mq7S4tYIsfnaJUIBM28m15DYvalyDBFZfjGSPNkK+REr/lZCr1cFHPppnHJJVNbKs1CrEEn h6Xsb0aAJBnx9e8gAHjVIDPAyHclTfFNI9kaVn/priZdOnHeImbY94vPKlHSp86YoN2BHXCwArT
 0JrjfmLk6Ouz97Zh9J5hMwYG3Ywy1uG9a4wUFARrVkbALCaQ9JnbTqiJzWQYzbKKgIbGYHGhUaT aIuXnbnUcqyEpqAiuP8SLg/6qbi6TMHyEIhaVJ6dankojurlLa5dBqbJcj7ktIuYISBMXnv3eJH jYdEEdNRZjeZew6ZXmn91E9romOtABWcS0SQc2auL4vYeXS8V9Z3MZivnPZ9EJigmqeXjSpemDP
 ltKZ1W60Y4uNZCpcjWbqckxiEn0MDyWI0Qnx7pwgH2CglANm9TKn2+O2pXwLmmc1FOypxfvg

On 03/07/2025 23:36, Kris Van Hees wrote:
> On Thu, Jul 03, 2025 at 04:59:44PM -0400, Kris Van Hees wrote:
>> On Thu, Jul 03, 2025 at 09:23:46PM +0100, Alan Maguire wrote:
>>> On 03/07/2025 20:03, Kris Van Hees wrote:
>>>> On Thu, Jul 03, 2025 at 07:41:41PM +0100, Alan Maguire wrote:
>>>>> On 03/07/2025 19:26, Kris Van Hees wrote:
>>>>>> On Thu, Jul 03, 2025 at 07:02:57PM +0100, Alan Maguire wrote:
>>>>>>> On 03/07/2025 18:06, Eugene Loh wrote:
>>>>>>>> On 7/3/25 12:59, Alan Maguire wrote:
>>>>>>>>
>>>>>>>>> On 03/07/2025 17:43, Eugene Loh wrote:
>>>>>>>>>
>>>>>>>>>> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
>>>>>>>>>> patch 3/4 feedback).
>>>>>>>>>>
>>>>>>>>> Sorry I couldn't find that issue; is this the 5.15 problem with the ip
>>>>>>>>> send probes?
>>>>>>>>
>>>>>>>>     dtrace: failed to compile script /dev/stdin:
>>>>>>>>     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
>>>>>>>> inet_ntoa arg#1 (ipaddr_t *):
>>>>>>>>     Unknown type name
>>>>>>>>
>>>>>>>
>>>>>>> Ah, sorry yep I have a fix for that one in the next round. Basically we
>>>>>>> need to add it to the core set of typedefs and add a type for a pointer
>>>>>>> to ipaddr_t; we can't rely on the #pragma to include net.d unfortunately.
>>>>>>
>>>>>> Why can't we rely on the pragma?  That is how e.g. the ip provider manages
>>>>>> this I believe?
>>>>>>
>>>>>
>>>>> Unfortunately the #pragma include doesn't do enough; it just defines a
>>>>> type for ipaddr_t , not a type for a _pointer_ to an ipaddr_t , which is
>>>>> what we need as a parameter to inet_ntoa(). I tried adding the ipaddr_t
>>>>> typedef to net.d and doing the pointer lookup/addition but that doesn't
>>>>> work either. Seems we need the core typedef + pointer addition or we hit
>>>>> this failure.
>>>>
>>>> Actually, if you move 'typedef __be32          ipaddr_t;' from ip.d to net.d,
>>>> you should be set.  That is what I did in my priliminary tcp provider impl.
>>>> I do believe that works.  Either way, we use inet_ntoa() in the ip.d
>>>> translators and that works with that typedef in the file, so this really ought
>>>> to work.
>>
>>> Yep, I tried that in the v2 patch series; Eugene hit the undefined error
>>> in one test and I now hit it consistently for all tcp/ip tests
>>> unfortunately with "typedef __be32 ipaddr_t;" in net.d.
>>>
>>> My assumption (probably wrong) is that the include of the library does
>>> happen but nothing triggers the pointer type generation for "ipaddr *"
>>> in the CTF dict. If there was a way to force that type generation at the
>>> .d file level that would be great, not sure I see a way currently tho.
>>
>> Well, like I said, it does work for ip.d so I don't see why this would be
>> any different.  I'll have a look and see if I can figure something out.
> 
> Looking into this more, I think the problem is simply that you did not sync
> all the dlibs for the various kernel versions with the updated ip.d, net.d, and
> tcp.d files.  So, if the kernel on the OL8 instance you test on does not have
> your change, it will fail.
>

No, don't think that's it; the .d files that matched the kernel I tested
on (6.10) were synced; the use of the 6.10 .d files was visible in the
error message. The problem appears to be around the fact that tcp.d uses
the ipaddr_t * in inet_ntoa(), but unlike ip.d (which uses ipaddr_t in
translated types) it does not have any other mention of ipaddr_t.
Adding an explicit cast in tcp.d to the argument to inet_ntoa() to
ipaddr_t * resolves the issue without having to add ipaddr_t to the core
type list.

Further debug logging shows that the actual type addition happens in an
order which can cause potentially cause problems in some cases; for
example with the above changes I see:

libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/errno.d
sorted (1/2)
libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/io.d sorted (3/4)
libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/ip.d sorted (5/6)
libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/lockstat.d
sorted (7/8)
libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/tcp.d sorted
(10/11)
libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/udp.d sorted
(12/13)
libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/net.d sorted
(9/14)
libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/pcap.d sorted
(15/16)
libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/procfs.d
sorted (17/18)
libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/regs.d sorted
(19/20)
libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/sched.d
sorted (21/22)
libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/signal.d
sorted (23/24)
libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/unistd.d
sorted (25/26)
libdtrace DEBUG 1751904270: typedef processorid_t added as id 2147483677
libdtrace DEBUG 1751904270: typedef psetid_t added as id 2147483678
libdtrace DEBUG 1751904270: typedef chipid_t added as id 2147483679
libdtrace DEBUG 1751904270: typedef lgrp_id_t added as id 2147483680
libdtrace DEBUG 1751904270: typedef cpuinfo_t added as id 2147483682
libdtrace DEBUG 1751904270: typedef cpuinfo_t_p added as id 2147483684
libdtrace DEBUG 1751904270: typedef time_t added as id 2147483688
libdtrace DEBUG 1751904270: typedef timestruc_t added as id 2147483690
libdtrace DEBUG 1751904270: typedef lwpsinfo_t added as id 2147483695
libdtrace DEBUG 1751904270: typedef taskid_t added as id 2147483696
libdtrace DEBUG 1751904270: typedef dprojid_t added as id 2147483697
libdtrace DEBUG 1751904270: typedef poolid_t added as id 2147483698
libdtrace DEBUG 1751904270: typedef zoneid_t added as id 2147483699
libdtrace DEBUG 1751904270: typedef psinfo_t added as id 2147490324

[edit: following typedefs come from net.d:]

libdtrace DEBUG 1751904270: typedef conninfo_t added as id 2147490329
libdtrace DEBUG 1751904270: typedef netstackid_t added as id 2147490330
libdtrace DEBUG 1751904270: typedef ipaddr_t added as id 2147490331
libdtrace DEBUG 1751904270: typedef in6_addr_t added as id 2147490332
libdtrace DEBUG 1751904270: typedef pktinfo_t added as id 2147490334
libdtrace DEBUG 1751904270: typedef csinfo_t added as id 2147490336
libdtrace DEBUG 1751904270: skipping library
/usr/lib64/dtrace/6.10/udp.d: "/usr/lib64/dtrace/6.10/udp.d", line 10:
program requires provider udp

[edit: followig typedefs come from tcp.d:]

libdtrace DEBUG 1751904270: typedef tcpinfo_t added as id 2147490338
libdtrace DEBUG 1751904270: typedef tcpsinfo_t added as id 2147490340
libdtrace DEBUG 1751904270: typedef tcplsinfo_t added as id 2147490342

[edit: following typedefs come from ip.d;]

libdtrace DEBUG 1751904270: typedef ipinfo_t added as id 2147490350
libdtrace DEBUG 1751904270: typedef ifinfo_t added as id 2147490352
libdtrace DEBUG 1751904270: typedef ipv4info_t added as id 2147490361
libdtrace DEBUG 1751904270: typedef ipv6info_t added as id 2147490369
libdtrace DEBUG 1751904270: typedef void_ip_t added as id 2147490370
libdtrace DEBUG 1751904270: typedef __dtrace_tcp_void_ip_t added as id
2147490371
libdtrace DEBUG 1751904270: typedef caddr_t added as id 2147490380
libdtrace DEBUG 1751904270: typedef bufinfo_t added as id 2147490382
libdtrace DEBUG 1751904270: typedef devinfo_t added as id 2147490385


Notice that the ip.d typedefs are added after the tcp ones, despite
tcp.d having a "#pragma D depends_on provider ip.d . So it seems like
the "depends_on library net.d" was honoured above, but not the
"depends_on provider ip.d". Moving the core net-generic definitions to
net.d alone was not enough however; including the explicit casts to the
argument to inet_ntoa() (to ipaddr_t *) in tcp.d was needed also.
 > Also, I do not understand why you removed the pragma
> 	#pragma D depends_on provider tcp	
> from tcp.d.

Yeah, not sure why that got removed; I'll add it again for v3.

Alan
