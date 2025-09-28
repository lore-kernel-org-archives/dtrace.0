Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8882E3594C
	for <dtrace@lists.linux.dev>; Sun, 28 Sep 2025 23:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759103580; cv=fail; b=MaKU1CybGjSEruzvB5cH9qZtwIdMJymbvxNnrI1j0aoAl93yWPl3cKvnVj/ovc6y5Y2rASgY4YVu5+jcdmd6glMn3SPSiMWaEfO3BK/fblJYW5yLXTPwG+DmLTGWDE2vWnH/orat6kH/mv8tZeKcvr5sqyY4U0NdhHj/xtsrdfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759103580; c=relaxed/simple;
	bh=59bj1NdwfnX91WfUBGFIIYxoKVIHV6E8yvQ5BB3l4YI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GYsUBJsFYsr6L78H5bM1VrrOtgPuox6YAZ1fDjGyJFXDYrzqfzjK8oJGpA/cobG5tg7NC1/jTnpI/uiI/GmLthvW2s/2lz2yW5GKD7xkAYWCluokZmsSIgKa2XT+sKKQt8BQUaSb5Cae9ZWUprBRYPoI+lNPCbhGDNighIExb5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Xd/GUONe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jXth6x4h; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Xd/GUONe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jXth6x4h"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SMu2MH002787
	for <dtrace@lists.linux.dev>; Sun, 28 Sep 2025 23:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=QqVGS6PcgQ18CEWZzJa64WNYZm+OBTcnpKlmoOg2FGQ=; b=
	Xd/GUONeW+ZvMCD7OjhqRVbfiI213WI6+Bj+tR5GmTpRnTO0K0L5VPQS4wg1HOTf
	bnmcvs7Aow3x7f2IiAR/zo3BN48gArnNi72CpHFDo9MM6Ee/VRuA3WDUZZxmwPUD
	RsCzWSNeaOT8cjWol5AmEDKjyt3zeQxcYQKl2sprre2hS5TY7/mJmWGeFTejXnrj
	C5WODhc/gBI/yTgXsaIJynkSbCIDLsOtk3JoeuSn797g2YXV7TTUYf0NXwYIWNEf
	s+Ct2OkZBnFbjTr/4gwLVOHUyeX2nNf76x8EOL+TNCBBcq60wsL1Zqazi/fIlQVv
	L9qhzayslwyMcM/vRsiJXg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49fe0k80xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 28 Sep 2025 23:52:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58SKhLPX024151
	for <dtrace@lists.linux.dev>; Sun, 28 Sep 2025 23:52:56 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012017.outbound.protection.outlook.com [40.107.209.17])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49e6c5r51h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 28 Sep 2025 23:52:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rh71uOvkIkbL27QHs3CPxI8pnO+eSfKnlH+jPp8seuwRxVCAdf2jviAQVcmqFzxEeYM3dlqqRNc0GV20PoqeSUjF3E1QUMtBFdIZKrMea/FwYSbu8ax6MNPDBFjDaIn1nONGE5ZJWEx9k+mpzaNDvoec2chCfN3aT5ywFLjsHAbXM89SVpxxN6YuR3jheJVQIkOdx0lwnnDoHdCvt507Z7tWzyxxnKc+1kdZ6SdK+l7r+wWNaW5gN+/7Sc3ie7ZOKN0DTEgBvyxZJ4+awm52OwnOTizkQnU0XGRz4ibbpeY/PAiXNwoF5OVj64s94s/Tn9IjE7jaPC/KoJY2iw1qxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqVGS6PcgQ18CEWZzJa64WNYZm+OBTcnpKlmoOg2FGQ=;
 b=OW+dvmcUahKupT/9kLDHuDta1oAjyxJMhuWJogDyypJ/fY+mZvd+EDHW2AMNJPYIY9+TWRRu5tGN+Z1iMYZ54+whZF4fc4tGPWtAA73qEctJW2Y3joHktUPSt7nuCK3q1Ufr+snciRevxYpJXxDemxG1mGuLDe9OldPgZlUYXYiZunTuA3aVrhfIwMDIkpDIsKoDZe4vTSPUNhCKRHUzZatHW+wa8hJCjAQqSxiMu1azWV5stNxN30tJQnn7+spDMPx/qjvTZRxHfS71lkAfiJJEoRokA2WdMo4W+CYIgnKaUkbjlDbTJVMeGEDapM4Wr6VJtVFHON2Gtaq36MHqBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqVGS6PcgQ18CEWZzJa64WNYZm+OBTcnpKlmoOg2FGQ=;
 b=jXth6x4hZfTuhESr4QOslPTH+TsXuOuCxiPgHl++tQYDruS2BpnaoXBw9bh2szsZwXyvTu4ujpbtwgmJF5yVbFQRySz2uVqj4N15+Z+yOjHpQG96QjgP2hXCw7j16LItR9HES16Orh2I3fKcmzIGaRWzOEGhHDuKmaUQm3hOi5Q=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB5943.namprd10.prod.outlook.com (2603:10b6:8:a1::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.16; Sun, 28 Sep 2025 23:52:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9160.015; Sun, 28 Sep 2025
 23:52:53 +0000
Message-ID: <8711a6e3-d20f-d4df-91ab-7cc3d7e263b8@oracle.com>
Date: Sun, 28 Sep 2025 19:52:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] Unify the handling of stack traces in the consumer
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672DF8DE55F2405F015D86BC21DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <dd3f36f9-af02-7cd2-7d05-39c9250fd89a@oracle.com>
 <aNnEMAcUWAHHayGU@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aNnEMAcUWAHHayGU@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: b209c852-fb4f-46a3-db84-08ddfeea23e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVpCc1kyN0dubDc2Z3lNWnRPS1RBLzdyVHFpQ2h3Ymx0UlhXamI1S0ZobVpQ?=
 =?utf-8?B?WEsxTEhWbHNqbEJZajN5a1pXVUVEMis3YkdwMXNkOUc5a0lKT0dUQUd5NXU2?=
 =?utf-8?B?RWZPUzlGRVRoak1CekhwRVRQbmM4MDZpVFNvMVBnMWM4NVMzd3BLN0ZCYnpO?=
 =?utf-8?B?RWY1MmFENHN0cnFpejRIcGFseEhaZG94WFczMTM2OTlrQmMyTEZZWWowYm9O?=
 =?utf-8?B?d0JjNWh2bUVJKzV5RlRhWE9YWWpBNVprL09pQkVCN1MvQlAyRmNSVk42dERK?=
 =?utf-8?B?a0dTNjA4VjYxS2ZkV3FITmRtZ2xqRUN1NW14ZGVLUEtzd2kxdzNLWmErM0N5?=
 =?utf-8?B?NG1zUC9GclBXdmhCQ2c1OCt6UWdLYk1XVjNqRWxYSkxKTWc1Z3RldFJvNDF5?=
 =?utf-8?B?VHNFZkJJK1JBcXh4SE1oTzFOd1orU0tpZ3N2eHFDYVhQZzY4MHcvWG1nSHFi?=
 =?utf-8?B?WDRzTWVMdEJaMU15UWRDWktRQ3Z4YUlYRzYyOVpOUTR3ZXY3TEtXUWhuUVVX?=
 =?utf-8?B?cVhwWExtMUhacDVhaTQwL0xTT2IxYndSUzh4YkJzMElLdEhQMi9vTmhNWU9v?=
 =?utf-8?B?S1pydHA5bldIakI3dkRFNTE3d2Rva2Z6WXV2TnZhbDl4eVB4djVTU2wxLzhR?=
 =?utf-8?B?TGJ6NnBhQmlKSExDSCtNV0FvZE1KbFYybnhzQ0c0NkU0d0VNWGIrZWIyQ0t3?=
 =?utf-8?B?UEtVUWZQOWVoaGxJZWk1L0Q2RngzV0oyRGtLVERSVUtHK1U0RndtYm9xazVh?=
 =?utf-8?B?MkFVUXhlQlhna3lzdjFKc2ZmNjhycUpmbXdWekFFMWF6c3RKSXMxRkpCbFN0?=
 =?utf-8?B?OFpidWZLY05uSStteVNiMEwyTmVNL0V5OWlyNW9TNXcxRmFESHE1TzNNbXVH?=
 =?utf-8?B?R3hCd0xDWXUwcytBMVdwNUxycDFQWFJwUTN2bUhQQmd3Wmk2YnM3NlowN1dm?=
 =?utf-8?B?MWVKT2VBZHZxRkZQZEhJT0Iyck14QlhvbFdpbXVUd2hlRzFKWktyUDErUE5q?=
 =?utf-8?B?MTdqL0FjRFNaMUJtNkI5V01NK3FqbFg2SzJDVC95ZFZaZnNiSklVN2g4TW01?=
 =?utf-8?B?Ym9BL1VuNDUzTkdmSkM2QWliZDQvSFlyY1RyNUhweVNFWVh6QmdYYnVTdmFX?=
 =?utf-8?B?aHNaejBERi95L2x1OGxPL1loWERPU3RoaXlmbjBkaHU3VjRnR3hFOTg1aTVj?=
 =?utf-8?B?VjdhaUs3bWMycDZGdDRkVC9lNFdYN0Y0Kzk4RjVjUU56SWQzV1JlMVQ3UmZF?=
 =?utf-8?B?LzRoWUMyWTAyeHRkN051NWdjczdreWttYmtMK3VUTTdRMS9xM2hkUEowZU9N?=
 =?utf-8?B?WWluNmtMNnpLaWh6RVVjTUxBMXpCRHBLQXQ1T3lkR0ltdU51Z240cE5JM1M1?=
 =?utf-8?B?eWJENkwzcyt5MHJTcFdNVkdPNklNSmhtaGdDbHI4dVlKQTZLRmVPMCt4V0pR?=
 =?utf-8?B?OWx3WUp0MzVCb21DbnNGenBaOXhXTHRTNnFwcnhibFVzNGJyNFE5NmVEODFr?=
 =?utf-8?B?MDJhRmZDWU9QR0UwVGZWeVFBOGllY0VwYllKSjZpNzhiTWI2VEpCLyt4RDha?=
 =?utf-8?B?TldTdnd3L2E1Y211NXoyL3NuRmxKZ09xbW90UEVaSS82a2RSTzM0RmR3aEVG?=
 =?utf-8?B?SkQ4SVZsR0RwZW1SUC9rWFFCd2xtUE5iQjBCUmNtczdOTUFSOHI0THVSTHRG?=
 =?utf-8?B?czArV1dNSGx3SHJYMDk4MVBwQVpoQVFySzN0c01zSTZLdFRCNXR1ME4wcnBE?=
 =?utf-8?B?bXVmU21iTmdPaVNWMVUxdnVXNCt0TndxeUtodG5uaW5pV29VSTVBMDAweWgx?=
 =?utf-8?B?MEhoTmJFL0xUVmt0T1g1WmRTNW9jSFpjS3BRUFVWMVNHWlA5NHVJckZSRWgx?=
 =?utf-8?B?RXlsNGhjVzgyM3Z2dTBlWW5IRXp3TUxhMVdhU1Y0b29CVjlOcDJXMDk4TGNr?=
 =?utf-8?Q?1fBi/1ONYecJetUogCzPEltbw0YgxReH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akVUQkxmeDdpWDZQUmFKS25paWtabW9xb1MwQ1k4VjZzNUN1TXM3U3RpVUNm?=
 =?utf-8?B?VnNtYnpGR2xuaGhYRVUzdXdDaWI4dzM4MWNzYUh2WkNrc2s0bFMreTVBOVlJ?=
 =?utf-8?B?Q09aREpTRnRPQ3oxZWozU09JTTB6bnVwVGJ6dW9OTktnVUp2RFBxWnpmSDFs?=
 =?utf-8?B?dERId1oxUjdLYmpiZFZLNzM2OGFGZ3diR29sRTFoT3RUU2NweS9pNitmL0pQ?=
 =?utf-8?B?WFZ4SjQvVTJtdTBFcnNwVUtnYlp3ZUIzYTlxSWQyczlhd0VybDUwVmxtZks1?=
 =?utf-8?B?TjNaa3U3cjQ4VUwxQnB0SXppdUlCVEx4c0grSnVGQXM2Z3lOOGZLMGZnbUtx?=
 =?utf-8?B?TXBNRStteHduWlJ3Q25kUGRpSHhoYk5RSmY5SG9vZnZNcmhpa0VOMEZFV21h?=
 =?utf-8?B?V3o4dzVQSzRiL2hWZDAzUFU1Q2lFa3lIM094ZUkvVDJodjlTb0FwcUkzNUVO?=
 =?utf-8?B?aEd1YTlSdU1SRFZZTGM5Rll0dy9RT0s3MFZOUkZ4RXcyQTlENEZxUVBEblNO?=
 =?utf-8?B?aDlBd25OVWVpRUdueXMzT3pYbk1RTUNvZm1DODMrN2ZDU21iR3dsWW9zaW5R?=
 =?utf-8?B?NTFTQVdVajN3eXJISk82V2x2Uk8xVGxDaUpySlMzcnJkMTl6Z2JTRnVkZldP?=
 =?utf-8?B?VncwbmJ1cFlmR25VQ2ExSU80WGRoaWxsckJDcE5GSlBORm1Ydko2WXRnak51?=
 =?utf-8?B?QkMrOXV3SzdJdGdkLzNtdEdwT0NISjNpTFQ0MzArcVF5N3ZOcE1yVHVxaThU?=
 =?utf-8?B?MzY4aytEOXFqTnF0WkVvdnE5TjNVVnZPTVlyZ2JFVmcvVVQ0R0c5RWZUdHNQ?=
 =?utf-8?B?RmxDQU1peE95MU0wUXNOU2lSa0FibGFHNnRvaU9mck9lblUwNVRJMVBpQStI?=
 =?utf-8?B?dE55dEJHVHUyTGZENDdrRjRnanZ3TFhBejlWNkZxV0ZISTgrbFdXTmVRWHY2?=
 =?utf-8?B?cnZpTXQ5MUVrbUN3QnRZZ01DRjZTYjRQekZOZ3AxZWlybkdReFZTd0JEM3ZZ?=
 =?utf-8?B?OXBycjdHQWNrUDNSbGlEU2JnOFVxdkY2dVUrcElXbkdqblVXTXVSZk5yVjE5?=
 =?utf-8?B?NEYvRjFvUlkralpjTEdoZ1dtTkNaWGk0QnpweDZIMnBzWWsybzUwbWpSUmNp?=
 =?utf-8?B?RDdQNlpjMzZSQ3pCSkkwajdaUGhwd2JnYTYvcmZoTWhiWVA3R1p5dnl2YTJZ?=
 =?utf-8?B?MW1UWXpyb1kzR3JHa2pMRnFVN0VEaEk0K1BOOVhocHBHM0tRaElTMFZjNDht?=
 =?utf-8?B?Wkdtd1BkQnRkdEtjdE9kM1N6QjJ5enhnTmtZamFJZ2RPck1kVVJVSlFWM3Jj?=
 =?utf-8?B?MElkT2xxeGFaMFQvRUtQM1pwRjVtWk9HWXNKQnFWdk5PS1d5VW9RK1BuNkg1?=
 =?utf-8?B?WjFYZG9KWUFNeGtycDR0VW9id3YxVmtwdWV4Q0FOWkFlVXZzZkoxQ0FMRkRi?=
 =?utf-8?B?Wi9lR3lIK2xiTkdINkJpZWtBblBLRTJVSHlnbnFKOFV5OEV2QnNuN2xibzVy?=
 =?utf-8?B?S1JNVnRlYmJZOHJsWCs3VDJ0S3ZBZytmRzNNaTg3bXNKYkNoWWZyUFU1QUlD?=
 =?utf-8?B?SnBqeTFaMEZLc1QwbU9yODA5cjFrNktzR2tRUzdnV3Z6OFRYY0NhVXdadEtY?=
 =?utf-8?B?UE9ENDM5b2NTLzAwcXRhMDhyeW56SW11elBESHNzMTRmRUF3NHNCaml5dVQ0?=
 =?utf-8?B?cnlIcS9lM1lGUjBaZk43T20rcDZ2TnJHNzJVSCtLUXVkQkh1cFQ4Y0tLOVUz?=
 =?utf-8?B?SUFsTGVZNk01NHlZcHdPYnNRMThvUWhRM1VUZElCU09mQVExOVdiN0p2ZXFS?=
 =?utf-8?B?cnpPU2prWmN1d1dSRldUMC9yWHZvbXNvK0RVa245WllMZ2E2T2g2TkRxNUhS?=
 =?utf-8?B?aWlFMFE4U08zdlNDWWNndlk5b01vTW81Z3NXeHo2V3F6ZEVHTnFWWmlZZDcv?=
 =?utf-8?B?emFSZ1FQVHoxRFZqS1h0aTNNNXR2Q2dtSzEzc3Q1QTJiMTdMM1dRZW9qYU1I?=
 =?utf-8?B?cUUxRDJqR1RJdjZBNWFPQ0NyWUViYXJ2UGtQNi9ldXpKOGlDaTRzd2lRbnBv?=
 =?utf-8?B?RTc4ak5kYWI0Qlk1Q1RYRENxWE42THVPdnJld2EwU3h5YjA0aktzdkFqcDRv?=
 =?utf-8?Q?aQZzomrdsMKqgMsKVuyHoQ+Z7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dWhTZHqgG/L/UTPIcdBuyGyWVQd5qen5ZUV4QwCVgGHOYAB3aFQrCUrCTFNbgum8v+7NkSqw9V826u+P0SSLC1YdUynrQjfhVX5sTAgUne7G02OXMODSreOGlhmytMU+gInyQWuiQZLXU4tjYhCh5I8WtPc2yC+IjdTC0T/LvQRAMyZLFPbnL28BKYdCdQmDGOa5PydPVO150iMWRB9nghZz1GAVAbH9TZRswnKtedX1Q2VEym55zFeSMGGzFutJxzeyoBtZgV3rhwAm7SjPpJ5NB+LcMT7pHw87rgvxdBrYIyzbnjWGoTpa4s8rEYa8sGddfQSdzg9WOyDlCfLqjT/em/yoQrdPh+El1ri8ZEaqCNjJHhTyFOrVITIfmk2P3x7anJjBxtGZa3pdfaDvQcqkCVRdP58rO3vTFMsiK5ANbTE7D0+OB/82bUDyHN2tZygasXmsbzXrfT14IIhEjxxQCtWSkPy9AEB16dk2TtIakhUCWxNZJT/BUGHqBQKf/j5pnLCpWoK06j65iZFjfaX11XSo4e/nTYMqGX+MGXqiaBZHg/dP6L+TvwP/USUNGes0ct1CXSp54dFJHDZPWTZOpvMj97qwF+ZY7zQTw30=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b209c852-fb4f-46a3-db84-08ddfeea23e8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 23:52:53.6388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GALzNWZvdw88j5nZoy7ENfD+//lZnIdQhEdC6ZYY+cGoRMtXNbmKMCJ5Jd/clCMVjlCzEGyci25vfUlEK3g8Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5943
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_10,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509280234
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI4MDIyMiBTYWx0ZWRfX/5RF4Ix1HyDX
 kc/tfthN/QKkwEw8C9DgmuSb4uN0WGZa++V7Be/BKouiNumjNZrb8g+5MQrNth6kEg2Cz+pkbUJ
 zC0vSVBg3zaMuacb4i0q6bVNZVvI35lfhTmC7GyYuYySJAa0mP7UsRPmz9KPYkJWxIPFgu+zM91
 V5J+BpWSmp5kRZ8hXLw4Kmf1gA9vS9W52aXo6iPabUQi9soFNl18BYfOt9kUO9XAwsKycqLCbaa
 Ycfjst0X/dosq6htW8gwnwwNrEltbRRIbu8baiCMfOHgCcbNLIy1T6M8Z+eshmuRzJyoDWOUyi+
 /GryrahVf6lGZA1PiduQBOQCwUBu3S9JUrnUOt0sTHEuorB8LRNd0Ycaw0K2L94/913opN1c68i
 JMRel95AM8zl+fKf0FeJaJsLsQ3UgA==
X-Authority-Analysis: v=2.4 cv=K5Qv3iWI c=1 sm=1 tr=0 ts=68d9ca59 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=SqP65BMmwFPUWLLp1V8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: wTYuOkE7z23emO5hdzG-u9DIzZHlQeb1
X-Proofpoint-GUID: wTYuOkE7z23emO5hdzG-u9DIzZHlQeb1

On 9/28/25 19:26, Kris Van Hees wrote:

> On Sun, Sep 28, 2025 at 01:50:02AM -0400, Eugene Loh wrote:
>
>> For kernel stacks, I guess size is always 8.  Could mention that? Also not a
>> big deal.
> I am not sure what you mean by this?  The size of the data that is set aide to
> store the stack trace depends on the number of frames that is requested.

Right.  I mean the size of a PC.

The code used to have a function

int
dt_print_stack(dtp, fp, format, addr, depth, size)
{
         for (i = 0; i < depth; i++) {
                 switch (size) {
                 case sizeof(uint32_t):
                         /* LINTED - alignment */
                         pc = *((uint32_t *)addr);
                         break;
                 case sizeof(uint64_t):
                         /* LINTED - alignment */
                         pc = *((uint64_t *)addr);
                         break;
                 default:
                         return dt_set_errno(dtp, EDT_BADSTACKPC);
                 }
                 addr += size;
                 [...]
         }
}

(Lots of code redacted.)  Anyhow, we feed in a "size" argument.  The 
ported function is

int
dt_print_stack_kernel(dtp, fp, format, addr, indent, depth)
{
         for (i = 0; i < depth; i++) {
                 pc = *((uint64_t *)addr);
                 if (pc == 0)
                 addr += sizeof(pc);
                 [...]
         }
}

which assumes 8-byte values.  Again, no big deal.
