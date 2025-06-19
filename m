Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3E218A92D
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 16:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750350744; cv=fail; b=AXRkEC2ydsKHRUjW71TAK1RHR4N9REB+pZcMcxKzZd5q4t8FTV6uZQoYMUr0zQgPVr5zcXlns5A9K0nuVUz+xH35jE26dipHQEWhnGy/Imx8erg4rZrRSzKSbcWgGNzutrmX8QtS8wc0AW7ibr9eIui9B+Lha874lCEm4eD8vis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750350744; c=relaxed/simple;
	bh=T20R/tK6I5WF3ekeP1rKUqSwYrlONuLBKlVzx0+ydnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BWuZ7esbw0O3cUvfksQzeAehKrb6xvLQZHtkWCQcasqSYwQHRZattL41Kv7fpo27ektYrjgICsChvlYPNkzfwb47+f/aAmz+qOT+Wcn59nKsYdWx4JnS8vGLyedi02Q0F6DMwqLcTv1wXmLCjEgyWuiKks/npIi69NFGxJKHRbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SP/HF8Sg; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mCUM3yo5 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SP/HF8Sg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mCUM3yo5"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEN2un021137
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 16:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=qpQxp7ZhynNpryh4mT15O3ZZjotDej3B3wSyZneIvSk=; b=
	SP/HF8SgPjkSqzs549Sweh3srws+hNUK7h9rf6Jk9UANmJI7MzyenUllm3lY/sXV
	apHX1Hv0XJw32Ud+RoRRyrsXSteQQB5N1Ub/kr4O9GjQw/JKdbCWQuTPpl7ASPod
	pXjaTEIqdVwRu9a42RwijqrhVZv1v8v0xV6b1VOUjRM8K+DnNICYhYmFrQmod2zc
	xEMTzO5p/AGYXsDalgZswXrVT1Vo0RDhMPwfE1QjO2ecLtuNA5bn+WJv6osSo/Ql
	JEyvx7fIpCbQtW/gO2dvjMNqj2enFOsZc6wCTuHtX7fle1lvnVE0nkuy/MH96jpA
	lPliNXyOIbjxUWBWelxvcQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvn9mam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 16:32:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JFONcf009614
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 16:32:20 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011012.outbound.protection.outlook.com [52.101.62.12])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhjjuxt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 16:32:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MF0Mi4D/nhVBtGG1PRLwHqa/n3N5YyMn+qPZeD0+HTNvtekQg+MGQdD6nBDxP9UT9nXz2Vvlux3bBxFdlQQeXUXDnDNK233HxK1Mkb7TZd2uCNzA1m6SykeCxpmi9d1cxpPZFEG00p9WSXB/3sbrVqqLSOxZ3IKnYUz6L2sCdFuWOww4WljLYqNeMuY9ZM4mfbKWvVHGlePgtHpHSKD7ahy3MiX+s1Ym+MVigKlFVMb2A4860kQfJ+MrdUrgjhUsZOGzK3mHIv7IZHJGIDbjeA4v3M8GNJhCe3ybTBN1sUj+z0EG5yu7DVa1RbW/vcdwzoYgk3vS6rdoX/yIude59Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RFe+llRlCpLm2O8XaBliUVyHlUvmxkAzgWG3yJR44A=;
 b=sSiugdBt7/m/8ePOKiCRws1nhRWAexbRfgD2QmeN6fXJNZxamBp2fy70XBmYiSWDb355yMdoyfJ9AJXtRwsgHI4dsNjMYaR00xscdh/byzwUzWysl03Rvb6bCa/gofUPEFuNrxVIwRiw+abyTCVo5em+UoggEvtd7oK0atTH36sVqXG7+UweqNUp5/jpa98iqIwkP8+MEl6rhxn/UEW7IYOVQ2R43ntfSSJfeVioxu7H8xKzsRbDEX1PlurOXQWaZZFlEk9WCY4Xs4D6ANaeHw17SQuqrqwmrVrYNUsU1DvqYIFEx3kjQAjLBufSm6bFgsyPu81HKzX7XgncA/V9Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RFe+llRlCpLm2O8XaBliUVyHlUvmxkAzgWG3yJR44A=;
 b=mCUM3yo5OJOlCe0fRr0gHs2bFOkWPNnri5HrXJK/LV7K281h7oUksHedvUR3l5m6YnJ91vyGQ55AGBQ0UF2N7IkxcsXa72HkOIJ6yWLtBXsFI1hH/W0JouJNkpECSzPUIY5PcUKPLhiRJHTN4+FRNqTZ4yaQ8EiYuNai6fnDrLs=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SA1PR10MB5782.namprd10.prod.outlook.com (2603:10b6:806:23f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Thu, 19 Jun
 2025 16:32:16 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 16:32:16 +0000
Date: Thu, 19 Jun 2025 12:32:13 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, Eugene Loh <eugene.loh@oracle.com>,
        dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 01/14] Fix stack-skip counts for caller and stackdepth
Message-ID: <aFQ7jfnA5eKnDMRc@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
 <87sek3d83m.fsf@esperi.org.uk>
 <6cdb7118-e678-57e7-adff-a74a1ff39e19@oracle.com>
 <87jz57zxvn.fsf@esperi.org.uk>
 <aFQ4xujz8hJRUGjB@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFQ4xujz8hJRUGjB@oracle.com>
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SA1PR10MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: df336fdd-7bd5-4a72-6739-08ddaf4eda4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?wlEnlIHDLMXsDjGvlG4H76a4uDkDtoGZixtgM9ttFhRUJhQFGWV7zagHzG?=
 =?iso-8859-1?Q?VbH8v1fGu9lxt8V5UCqD6Q9o71UqaYmfK2cTYY68fP+xTlucn25GAmTobQ?=
 =?iso-8859-1?Q?uJR0SNdLDLYX1kR3dUvSrsZhammXlTqrm4hiUgeUmqkI/4qZsxp4UmQYo5?=
 =?iso-8859-1?Q?Kvh2Xi0Dt2JF5V1vJpROXQ/6qIU4s7ag71GqoKyVvzy2QYMSYMPW8Jbf1q?=
 =?iso-8859-1?Q?UPYam+x/7cEu2OvDDCPpvx6Et5Kq6VbniLW7reJkvFc9BWA3eEW+hKqSf1?=
 =?iso-8859-1?Q?779hncGi243m3QLKDFLlUr8GCMZWhCRCSmguyDbaPIgEJ5I2hrGGT+kAab?=
 =?iso-8859-1?Q?jsCBg5psteSiHoZVUVSAG2snzjEXxTafJYGl2Sw8S1F8lnyk4nKzaqbprd?=
 =?iso-8859-1?Q?VXk18lBUygNaigwQr2zwQJ7ME6BhT+NVtoRIcKgAS2ZwPHwBDArCAfv+T1?=
 =?iso-8859-1?Q?PCMexUTKOB56n1N/BpZ7p1zcJhkqlWVeBOkjfBYwZYWtVnDsiZ897lm0iC?=
 =?iso-8859-1?Q?Gw6ppWclWqWprLNhDpXoU2iSA2ylotDNnwpxoAo7NMrmk3c6khisEVTG9s?=
 =?iso-8859-1?Q?yXH4W67mAylcC1gkNDz93BxxtmcrhfR+uXYJNWqiV99KaeOgu2IiveIQtt?=
 =?iso-8859-1?Q?AT7V/mvUQmrAdWqxt8eCXwP6+N5u4IBGVxYWSd6d8REfg2hq95G312S1ST?=
 =?iso-8859-1?Q?PJuNIg5MRAyoQKO8mAc6ocmDklVhJovuOeRIvsffYuKbVER9jmYALJBRF6?=
 =?iso-8859-1?Q?GiYUwr2PuUUXUsYMU0e3M+qSqO2U7G1MQHDN1zjDNqtXDd9uauQwkSKOIl?=
 =?iso-8859-1?Q?ewziobYoD5/moVBao5WiUv6sejAppPS3cXo8N001FlC4sDQlxTXhH2J8Go?=
 =?iso-8859-1?Q?O7G/P/cKcupePrQKrxdrxTXdku4QuUdPhebj4Vr5OH41MlL8fo2fW8aZi0?=
 =?iso-8859-1?Q?O3bi4rkDm2GSj2DURyBC/WG7D3xO5L7TxcIgb4MOjfOVChaAdU073O3pp7?=
 =?iso-8859-1?Q?UA+WVNP0C0wxZP1PC8tp9FGQyVPzebTBX91wQWLkhke7BeJ8IxZnOOiPy3?=
 =?iso-8859-1?Q?3czV8TIsiEiW+UASmE76kN61iMK352yrEWv+11ey7Y7tofE3OXgqfcEWSb?=
 =?iso-8859-1?Q?2Ns0StrHHstjiRxJJCq08Anv5wAchJ/6W510WzAmK63v60BCT9VSjXh9Mu?=
 =?iso-8859-1?Q?sqpBdWhBBRix/rrBZwwisn9pVVakOpzRTxBjlhPl9HPzj9ufrXIOPSfmxD?=
 =?iso-8859-1?Q?7kPahqVWLX6PV1QnimdFTNJikM4uxDlRNwfakZ19KY07uoeSYsRlqGDcIf?=
 =?iso-8859-1?Q?DmR1KDomeTrFPJCYKmydqXLt6/JxmbU70DdshfGLHiykri161Y58wTyBtG?=
 =?iso-8859-1?Q?pQY/gFN5+gmG002DAKK+gxTgJdSptaeVGVko52GRqdutlwU0hwUW/Nq5+i?=
 =?iso-8859-1?Q?MbsO7m74AV3orhcmOvpMWj6EmK/ljRLAl0ZMg+NVR2mR60FAFPcJkbQ6nX?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?PnbbCPujYnQ/hxPczaVGNVwjp52K+Ol6Uy5Ylhq+qXUxcGD54vKthx9Psv?=
 =?iso-8859-1?Q?RgtaT2Rbl5wnS6JiPKwVDQgRkMyOCV6Mr1GoIzuSToCXQcY7Rm2G8kkvta?=
 =?iso-8859-1?Q?C8CmLMMRhFnI2NlA/JssFfzglBMMFeL970t+wJBNJJHFn2btd3eMIojYSG?=
 =?iso-8859-1?Q?RVaVb18VbyanSkKh35X8C8QIqGVPSNFPUyUcBG8+Wo5KxCT+zgEZTn+030?=
 =?iso-8859-1?Q?aMs6mXpwwZFefIjWs/NVgZGg1ACLOAc2JGhjXQuJ0fb5L3Nfa3jBFggDRh?=
 =?iso-8859-1?Q?b3DdF/IFk3i0GY6a8doJEBlM6LUdyxeTEdGFrgEmg86QLogg+Xll9803pY?=
 =?iso-8859-1?Q?1bjWkbLLYjQGPLP19knJdkc0N56OYWcI/XKCXJ+hTj6WDN+sBCSye8wvrP?=
 =?iso-8859-1?Q?Dsq3/TBR38x2sHkWhIg+XtkDhKU8CJioRKAl1oXWCSpP4MQ4Jz+0Pfa/p8?=
 =?iso-8859-1?Q?q3vJP2gBs8rMxEOq1aHVqON1vpFUQv57sZ2eLjoWmKelunBb2D7D46WtNL?=
 =?iso-8859-1?Q?C9GU6QSYIAwIjlxx3FYo6P0qR/8D1zURXQKXq9WLqFcXJNPLJEe4mpRhQq?=
 =?iso-8859-1?Q?O4qZ9EtVJRQqTh0DM+Ay0hvZncl+cgnVw5pJgKK3F8Prgdts0wGi1xxMsd?=
 =?iso-8859-1?Q?JQhZ8/MD2vxqrk0GRg02VpUSyATu9wMk90j//bpqsXqrs5m+P13bN9nZIK?=
 =?iso-8859-1?Q?iwk5ZTQKFOwgrauF90wtX6wNywq2Eml/fFGLmXidEgd0ayDyBdkVzUei18?=
 =?iso-8859-1?Q?t1LU1ITLVRm9Z/RF8nNRMbBio3keMFIn117sL7NHpbZjYHpRhAnY3l8Pq9?=
 =?iso-8859-1?Q?Qqf8OMG3f90icSzSi6j/KGTKSqmH8DSTf2HYlpoLdtB8gCz3YvDJE1LNtT?=
 =?iso-8859-1?Q?OMtIuVpbD2JBDDg1jlxs1n82mkmMWLFfhQ8aNSg7rNKmqJE8nATcNg1ky1?=
 =?iso-8859-1?Q?2KsEr5X6IPdmAfzTJlKNxZzvFasYl+SgxeTe+TMoukWN1hkR9gsAb1Ou+B?=
 =?iso-8859-1?Q?sziQS2Z8SJjbvxitf6+glvUVj2ky9n95bZ7Qn2HdR7Z1lqDq2Ne26kJpDB?=
 =?iso-8859-1?Q?b4stbAHiljPILkVETEUwnD5+HSmI6v5shi+7irmo+nJ6X0omHH990TW8cl?=
 =?iso-8859-1?Q?s9CyblN4LP63qw/LZNWIxMF663sSImgDjZx2DeNVpBbYtfcuMsLWUHXCk7?=
 =?iso-8859-1?Q?qkBooO+8P2iJZN13zynVY/O7N5iFCKfBrsVD+WbVITYuLn3x3JQ2yIVnmd?=
 =?iso-8859-1?Q?L2XK1V3RNChg+TP1ykWZovRV3mp7ZzyRq4NK8Goi8Aj14XnSYdBnTRNks+?=
 =?iso-8859-1?Q?0TJey7uWiKb6DHV6wYrzw6C1HXDEQlV5DawH+maeEz1Yf/sdM8UoVCMzy9?=
 =?iso-8859-1?Q?tixmvTWiprBNteLzz/Zo2MsxHRvWgfhX/3hVZTYvIuBuAtrp8jAFDld0+o?=
 =?iso-8859-1?Q?wcYQ9jE/lPp6BR53YLu4vMtE9DOJvqTu2kZ7e23UiRLFha5B1n3x+xQJ97?=
 =?iso-8859-1?Q?jpS+X4KpH9YT8WDyoaZVM4ZcmSZq99uSUfGdeBqHovxGEwG66musLdjEE7?=
 =?iso-8859-1?Q?aTIewPln8CnOVRc2Ok9lk5Vwpz7WRl5iasI9qJMmC883DBFhU93CVYfeHJ?=
 =?iso-8859-1?Q?RFTPr6nYM7xFZhJLuZeU1RBKmwrrLFum+p/1SvP59y4UZTlLDVXiEDWg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0lWWc4oleCJ9RGeZSIwMba01o0DsrZpPe15D3m0wcxRhfwYL+vsNReLk842VJv72rTmdYVOUE3k/O3QQm/BivVQQDPQ7z3aGZAJnEZsjiF4rpW5wlA10PVDiS9UhsFYCoLqw589M1xOUdIikh2sZXSSLbFsEf026dtCn6j1BhIgjGCcOV7gi4vsoAngv5AedKn0M3V2AB6XiO10gxE+n6y22jcgs6EIKUaqlonPuvsWaBo8tluhsPkG11G3fPLvj8MXPN7+DMoi8KUl61Vdf1G3DmOf4AnZlB6JXA1iXxYoorY7fk398W2Tu/wFR4jy4pwVZ0ikHtVE+1ohqD8+Gj6nJo3BPj3eqhoT7BNI5b8SsvHcs8KD6EdTPRoO114KJgAYlEvEFuP459GNbLNXU/IjSfT9hxKj8j64jRbmSmbHxYi4RTrbZwHyT8eVzuxWFt5HnINH0vdp2iY+pG3q0LXDf2ERtczP8prhkSqp8/fuXkH1n3dY1XF9ha4VRI/NqEuzrELpY80yRBVMW6/sIQoE2nqU2+RkxQPZ6oHW10rwglr/XHCBIEy0QArdxUuqS/iFYvGTxe0NEz/FEuxu8P4HQIrReHM04mKDTeb1RRP4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df336fdd-7bd5-4a72-6739-08ddaf4eda4e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 16:32:16.2239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3cURCIhfIOdyOICund0YITVkzeHIY1GKJIEhpCpXaSFfxVhu7P1bVsGvscxbJ2z3uGTy0wme3zlpb20OyjERAkKbRzRvTTsFX1GGciZP6gY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5782
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506190136
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=68543b94 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=ZEZ6yhN9vkrDtev8aNcA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: jLFJoWyhfjIo_jj1AySTxTegMxnO9tbl
X-Proofpoint-GUID: jLFJoWyhfjIo_jj1AySTxTegMxnO9tbl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEzNiBTYWx0ZWRfX05xHlaaF+Uph XMmMGa/hpGaWAmNhtoYTRJ3KRocpTbgeRwhposKNn3Hod+LFrGMci1vQMUrAc6bZrfn8W886C56 MHX/n0dQxb4OWl2PzWAt1Jj+kY1DfoWAdEEHtEde5EssvIPmBzbKKT5xh4KUC/EYg7BJsPTynmJ
 6KB7V/QgTZt6aoQlRen3Pm8owIp21gZjGG9PHq3aIBvVebatAsvZ8G9Prt0STJO/+UQs3AjYzWf Fq2tfEePUqimI10GlNJIr4PlD3MHdfAeF0SHkTImoFLfRYKZkz3rlPNoTYiGTuaqCE9tyqjF7pE Slj9lX5VDeus0dKprv+VhtpVsldD7ba6R9g/s/e4j33g5imLDMqmx3yCVgkfjVXxm5hHI+gZfVf
 ee40rUM6plgKkyyIlPP+pNVwQe4bXlbNFPXQ8RqD/gECMGRVmUwp5tVBGW2uwC9MqFA0yaR4

On Thu, Jun 19, 2025 at 12:20:22PM -0400, Kris Van Hees wrote:
> On Thu, Jun 19, 2025 at 02:03:56PM +0100, Nick Alcock wrote:
> > On 16 Jun 2025, Eugene Loh verbalised:
> > 
> > > On 6/13/25 10:33, Nick Alcock wrote:
> > >
> > >>> Note that we declare the skip count volatile.  The compiler might
> > >>> optimize code that uses the STACK_SKIP value, but we will subsequently
> > >>> perform relocations that adjust this value.
> > >> ... why doesn't this apply to every other extern global variable in
> > >> get_bvar()? They're all similarly relocated...
> > >
> > > Right.  There is potentially a broader problem.  But we simply do not have evidence of misbehavior in other cases.  Ruggedizing
> > > other cases could be the subject of a different patch.
> > 
> > Aha, OK. I was just wondering if there was some extra reason.
> > 
> > > The problem in this case is that the compiler seems to assume &symbol!=0, which is reasonable except that we violate that behavior
> > > for our relocation tricks.
> > 
> > I wonder where the code for that is... plenty of symbols have value
> > zero.
> > 
> > But, really...
> > 
> > > Consider the C code:
> > >
> > >     uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
> > >     {
> > >         uint32_t          bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
> > >         char              *buf = dctx->mem + (uint64_t)(&STACK_OFF);
> > 
> > Hm...
> > 
> > extern uint64_t STACK_SKIP;
> > 
> > So we encode information about the stack size and skip value by encoding
> > it in the *address* of the variable? Is there some reason we don't use
> > its value? unlike the stack offset, we're *using* it as a value, not an
> > address...
> 
> The issue seems to be (and perhaps this is a cross compiler problem) that e.g.
> 
> extern uint64_t PC;
> 
> and then code accessing the value of PC (e.g. foo(PC) as a call argument) will
> yield:
> 
>   50:   18 02 00 00 00 00 00 00         lddw %r2,0
>   58:   00 00 00 00 00 00 00 00 
>                         50: R_BPF_INSN_64       PC
>   60:   79 22 00 00 00 00 00 00         ldxdw %r2,[%r2+0]
> 
> which shows that it is interpreting PC as an address to a symbol, because it
> loads the address of the symbol and then dereferences it with offset 0.  So,
> we cannot plug in the value during relocation because the only value we can
> put there would be an address where the vlaue can be found.  To get around
> this, we "use" Tthe address as the entity to store the value in, knowing that
> we *never* will interpret it as an address for these specific externs.

Not a compiler error - since PC is extern uint64_t PC it *is* a variable and
so it is present (and accessible) as an address in .data in the location where
it is actually defined.  Since we never define it, we don't have a .data (which
is fine because we only use this for constants known at link time) BUT the
compiler of course is free to assume that we *do* have an address to the
storage location for PC and thus that we get the value that way.  It does not
know that the value is constant.  So, the trick I use is needed to make this
work.

> > >         uint64_t          retv;
> > >         volatile uint64_t skip = (uint64_t)(&STACK_SKIP);
> > >
> > >         retv = bpf_get_stack(dctx->ctx,
> > >                              buf,
> > >                              bufsiz,
> > >                              skip & BPF_F_SKIP_FIELD_MASK);
> > >
> > >         if (skip)
> > >                 return retv / sizeof(uint64_t) - 1;      // branch "A"
> > >         return retv / sizeof(uint64_t);                  // branch "B"
> > >     }
> > >
> > > If you omit "volatile", the compiler assumes &STACK_SKIP!=0. The emitted code has:
> > 
> > (which is a reasonable assumption if not freestanding, I'd say. Why
> > don't we compile BPF code with -ffreestanding? BPF is almost the
> > *definition* of a freestanding environment...)
> > 
> > >     *)  no run-time "if (skip)" check
> > >
> > >     *)  no code for branch "B"
> > >
> > >     *)  only code for branch "A"
> > >
> > > If you include "volatile", however, the compiler caches &STACK_SKIP on
> > > the BPF stack and later performs a run-time check on its value to
> > > correctly execute either branch "A" or branch "B".
> > 
> > This feels very mucvh like a workaround to me. Does compiling BPF with
> > -ffreestanding help?
> > 
> > I mean it fixes a bug, so I suppose it should go in if nothing else
> > works, but using volatile is almost always a desperate sticking plaster
> > and this feels like one of those occasions to me.
> > 
> > -- 
> > NULL && (void)
