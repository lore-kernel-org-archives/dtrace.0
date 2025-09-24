Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114E21E8322
	for <dtrace@lists.linux.dev>; Wed, 24 Sep 2025 01:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758677299; cv=fail; b=EeKBqlWzX9dsAII7UPNsTvLdg4vtGfTyJfeb7r1Eh2Are0PgFmmB3bAcucusscUY7WACuvRJPJWq2tLSew5eNzQ3eIPY61UxbPSbCx2RIETZtB+f+tjo6b6meTmz3dcAv/W4tjNoCN0gtXNPr4TI1ANsIwlzl8Txm683L9fLmow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758677299; c=relaxed/simple;
	bh=TR96nYvnnjvYMmugCX1OIFZfvR2PiDtyftOJCD4kLR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PGfHEBQODVcymYMigOHG0PMEXw4jD2fSimuvCQsOQsjK+yeqUepG31kWkkuPQVvb+i6Fq/HQZoaQEMP1YZYFPxQk9kmh5bYSU+qPcNzC32FpvkzPzU4YCwm4YWyCI2bqv9se+pIyMaZgHKfB0Ns1D2k4esxca5Th6XC7Hzyak/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kqYKUm5B; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mqa1JB/f reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kqYKUm5B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mqa1JB/f"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NLbM6G006772
	for <dtrace@lists.linux.dev>; Wed, 24 Sep 2025 01:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=MczX9673D8Ws6cyH7uU6xIJGQY8wIVrfPXHufujPOv0=; b=
	kqYKUm5BFpqvIuG7syX9e8U8A8WJBuOm6jdCdaugDZW5JPd6+AHVqsio6FNr9Xd7
	pSTMhm5BEm9zGMKWhwH+IidPAJgq849PyiknDskjK0/gY9Od+4M/8RFfhUf0EWtL
	GEtIU9Iz866jfSiurBjxU58krXT1J0XusRtE5BdeVjgDwBIVlGEdtP9LKqCfNERZ
	thIaIemPC91bOiLl3O3h64vjpNGNA8G7fh5M/IdYug/MNWaTGpx9FrIwCqq9qrBO
	3w7AMyvkr+O3+YqA0Uu7piLwkE43Eied3iTltHtsgznmjk22iGgRuRRTnR3IFN3+
	jQJOrqIoA9RFF2hFmvZRHQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499m59dug1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 24 Sep 2025 01:28:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58O0MOqT030604
	for <dtrace@lists.linux.dev>; Wed, 24 Sep 2025 01:28:15 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012014.outbound.protection.outlook.com [40.107.200.14])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49a95039es-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 24 Sep 2025 01:28:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UY5NOk6RwrPs7dBI8YxsWzuxXB2GU2E/CGWb5+H2Aii+V/U+slJjOwIC6ilJ/JWH3i9iignGbW1rcqEyFi0Lcg7kxAw0DPGeUi/oKHQnx8SG4Sh5yWk8qWQVBeGYJzr1Mwk+Ph0PLQSrRfrYsph2FEz5nVZJkHg/1iyWPp4OikfcunO6jg4t4Iyn1Ii+A9NSGdINw3Yl2ulEnHy7rQ8D+EY9p/rUNh0Z33ncKudkvy7HX4hAlc3IVrFqX1OIMX3CaLyBT/B6TkW/63PK5pfKOY5+P0otAWuHr4ajbS9T9wQmVjm1af7MY2U35zq3VuYBWxui7skdHpjKCkcJ8RQOMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UPWax1NflbVjJbqZdKuefebRrKA1tQXjb+dma+RRhY=;
 b=RTcqv2zqMICW45saiofGuof4EkAfbvSvEUF8n/5xeOvdmtKMkOl4eIp9qWiZd+Gf44GL168UcIrI/W11STd6JBOpd3aNSHaxwI+Za78itmCHV/+d1HMHKiXzBrjyZVl04i8d2kcPVBL2su3DrHHFc/YXCsGvKscgF1C9iosOybtb9FZp4XUbcujnvEEASrZiu+gEHqMqe9g7KuFQibSQbS4wvM98hP6OgMy92Uyj079i7fsEp3Ee/zsOtln9PBqOb59cc5rdK+YKvgh2lXtzPVLPgKMcPe/twgH2if6js9M7fzKRKgN/fZp8SEoAxhnRpmMVGjcP2TgJWU8s7VHzPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UPWax1NflbVjJbqZdKuefebRrKA1tQXjb+dma+RRhY=;
 b=mqa1JB/f+9SMTaYw5sTrrxURDeOu+gR4aVF67ZnASEqIwYTDLBiTh9GfV5qxlIqoweKyT8/3U64HpX4IrHjL1Oy33H99wBd8u/l6Wi6f4kC/Mb6Rl9zSGMQDu0aYygKB5oXeiKVKjV0YAyAT7vRa4Ax2rFqB5Pb/ChP3KQ9VdHU=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH0PR10MB7028.namprd10.prod.outlook.com (2603:10b6:510:281::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 01:28:13 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 01:28:12 +0000
Date: Tue, 23 Sep 2025 21:28:09 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 3/3] cg: fix masking of lower 32 bits
Message-ID: <aNNJKcSWLq/w/3Z8@oracle.com>
References: <SJ0PR10MB567238056385C0BCE6329EECC21DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <f972089f-e2d6-13a6-ef53-bdca98472db5@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f972089f-e2d6-13a6-ef53-bdca98472db5@oracle.com>
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
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH0PR10MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: e8f12be0-b5ad-4712-f81d-08ddfb09a0a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?QLzXDJ+6EDEsLRNHw015IPr8Yjv7EFlbyY+L1L8HdnBCEpp/z2wWBkJ8pP?=
 =?iso-8859-1?Q?yQD/DsXhlDWequbZD58eVAUQ4E+y/Y52Y+FuBt6vW58v6BFuY6Bs24tT4F?=
 =?iso-8859-1?Q?fcV0LqYJypS4aDzOF0n5bGT5rNaJWyWbRQAIO2JFV6PeQyT2hIoclsAHGz?=
 =?iso-8859-1?Q?79aT0jIfh7eauyHYuSEWZh/3ylHP55Fkncy0x8+tOsWOocGSws0/dKUxv3?=
 =?iso-8859-1?Q?yvXjWAV6ieRk3cU6VZUkE7mK9Bwbl81+UgsffZ+HmEIL1Cbelcl9bV8bHt?=
 =?iso-8859-1?Q?T/itTEPYpPb5eV1a8Qfwn0R2cuJoe3p+r/8/4j5MjLO3qPx+1rztedCdef?=
 =?iso-8859-1?Q?wMt07aoue8g5IQN6rZvrnGrRB7QNH56scfHd2OgUbN9XqGiBuAU5TSMQEL?=
 =?iso-8859-1?Q?SKe3y60MRA9vYv2ImlSRc0g72sSU5LcH58mBJh88VLmOKy9d2bd7/pqqHw?=
 =?iso-8859-1?Q?erJsTxeWaquHUEagTfTV9WmTQrsluMPLQUVxQvPW94mATV4TtmqAQRR4Ss?=
 =?iso-8859-1?Q?VrxJS64fArKIINSwRbgdrBkZf4CS5L/0xpXRWH44r0gS+MYA9gN/9hitIt?=
 =?iso-8859-1?Q?ume4/5pCoExNxg9iyCTDWje/uB3qQf8uVaHtD1mZXUXg4XspqBGwpYLuEo?=
 =?iso-8859-1?Q?YQR/EkjICnh458iB6slCxhmVfNh9jwE2Qf/93DDtuWa71HDZRnj9Q/6t5i?=
 =?iso-8859-1?Q?/Qb93bDmuK8pabv9ltKhMT5D1B4X56Et7DPB164Q8UiQA/4mHjMloq2Atx?=
 =?iso-8859-1?Q?GCxsFNUfy9Y1EzN6NRVjLODevcmWbRLzUgsEhj/ucP6lOpNZ84E9K1JUqX?=
 =?iso-8859-1?Q?M+KsuPFCQUKQ79uQy4exNbTNaojCwOejd/MSx1ieZayteR67SP5CursQSf?=
 =?iso-8859-1?Q?kVbgxtM9w+clnsiy7vnhnErOMQ4n3dTpNIZ328wAKifkS5WrUZjWvhUWtK?=
 =?iso-8859-1?Q?RCB7cUJXY1dVBbnd7tcpmCQMoLZ0sBlqaijnI9yg8SzOk3UkvDkwLrt34O?=
 =?iso-8859-1?Q?WDpOzxSO4OkURIhBNZy9+LBREvHHrbpKHnHIIx4tXEv3GtQLgUDcNfXJs4?=
 =?iso-8859-1?Q?HMZAqmyCypGeTXlqPQIuCrJfsAeHeWEyEHPLFckL1g7YJ4vGfYLHedAme2?=
 =?iso-8859-1?Q?TXg0fd1GzYmrk00Wyp41KHp8kKSAAZ4DLhkP12tFVS1Hdfmcpa5AwIjdbL?=
 =?iso-8859-1?Q?cdRR/kb9RDdZ0Gy71AiJtPqJnZ/Mg46zr0pWXH9WSOXBnPUY4QV9EVBXwp?=
 =?iso-8859-1?Q?47BC9cWo/63gwJMki+AneZgniALXRNkwfqpVrnd3gRnqLQ7YTXiJsZTpl2?=
 =?iso-8859-1?Q?ogG+hIp7RIhy2MKskaQjbyLGCV6Xrk1TGC7mMVJdo3bUiHdSDLgfqRylVA?=
 =?iso-8859-1?Q?YTvX70+f1Kw4s8lYI5KJ6JQhVt/xxomCHzKjk/qVujl+SAvTuQrZhm8v6O?=
 =?iso-8859-1?Q?wB03qO8ipXh4lxX9/StZtfnHjdmiDJuOn0v6k2P4fJiFJ6Ny07EOkQIa3I?=
 =?iso-8859-1?Q?A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?4/VXi5pU4m92ojR85l87UDBlHp9r2TA9F2jPFJYq+FCFDYgpjcHYOwwhd8?=
 =?iso-8859-1?Q?P27eClXuCOC8FVRso5feQ/33/5acOH4fNNMpmFCn67tm/acclBJXIbVyL/?=
 =?iso-8859-1?Q?u9HfNNIYbRS02ppvciHMka6Vu61jj7CTnffMbm34PbeqU8+T3nOPCw8apL?=
 =?iso-8859-1?Q?ccbMAFyoBhTnVYfuK0OR6DHl5ZcZYRQElvKedItamfH6Ovz0D/9bBtpvcQ?=
 =?iso-8859-1?Q?Qs7842j4G5RUv5jEl7N/EYx3GMnBhhDjSfAJNicBD1KtDnKRlenjYgsXCC?=
 =?iso-8859-1?Q?U98L0P9HzJnOkM5Cz863vnELrV+o+Pf35nrPR0ZTUDIfZn7rCLN8XD0T91?=
 =?iso-8859-1?Q?Moph1Kgl4QFzBzagF2YSf171MfK5yCLrCzSiN14o/tEqKiZyyVcK7SyTwF?=
 =?iso-8859-1?Q?VeyZ9d7XTTtFlhRUmN9Gp1Q8Q9gPYCeZm7nGviUmb9wT0yy06A6lmkXGif?=
 =?iso-8859-1?Q?qs4m29BTdAmzOhiEu52I9LdELcic/mxPk3IkbDCzOSqFadfmt3vToQW1nF?=
 =?iso-8859-1?Q?aXfDK5yUwqoDCfAwK3UmFOpQ++LJNn1YtbCjKA6YCIbi7Vz6YPLq0QldNj?=
 =?iso-8859-1?Q?jSWHI/kafA3vi172eLnQ6CTTtc9sT9msfLLENCablfelR3grkiSfyOb+qu?=
 =?iso-8859-1?Q?n2ow/QQDUEN6+8RzcWaMuUw5TBK/iqp7+zYhvrKj7YOY73RqNXATBp1fjW?=
 =?iso-8859-1?Q?a52j61pF64z3dEmM4A2KOZJA2iWTyFjiNPLwQBu+1xOmqEakvA/2ZSrjkC?=
 =?iso-8859-1?Q?fQyjbmFwGfSwvaj7Les5lnBGa2H7/+olkP4qFm78f4Swy/aGYG957P+Frf?=
 =?iso-8859-1?Q?ZBdW7bhJ5Wi/5JVauwA+EFjGnDyUvFvG5bzb66dHPrEjHslmmLGqtZRPpY?=
 =?iso-8859-1?Q?Smd6GzsRmpZS5yEP7rkIZyrziOpyygkU5sMsMo8oXIk3N1KPjsOUFLosvx?=
 =?iso-8859-1?Q?GNpRGLbvGCQC1aZaHlvXq/4qoxYe9+WicQw+/2j7/8aEC1VC6twP82cDht?=
 =?iso-8859-1?Q?xQWfgbUitCirm7kJnDkf4q6NWIL24XIp7ObERMx2lGJex8xuIxnRKCt29e?=
 =?iso-8859-1?Q?0Y5XQ+09YVJXLkxGxIc++oW+oV4/BCQjmWGdjKo23crO0BrD3M5InoIEhG?=
 =?iso-8859-1?Q?DQXftl7bXJz0JsWdJ9r8DDDzrsl/pGaxngTOF3/aEVUrOE1n6grxd5krv4?=
 =?iso-8859-1?Q?WUBNpeGQPvTAqVj+xbswMlUqGGsh3Tq9Sblxa0XzC9dBbnEHEXddlctYh+?=
 =?iso-8859-1?Q?IcUiK2MphcMAVmq+YZbSCA9VIQ6+kCxheHKxIcWQuUVCoGJknHDvlM753u?=
 =?iso-8859-1?Q?YuTTU5Ls/kPJOzZY4fZiC2PbYUdCIXPrgWr/dmgGCyWAUvUU6jYJTHFWEb?=
 =?iso-8859-1?Q?jT3jA6ljCvkSFZxgxIi1xIC8b5u5fRrk80aqG7RYnFPL5SbeXCOnX+qRUI?=
 =?iso-8859-1?Q?eoydkhnOtSzrqL0RulnAKHWtJ54x6f6EQqMt8i+kcg3zGNJcC7VFb1pJ2d?=
 =?iso-8859-1?Q?PoU2/I9ghIdWZqaW1v4AfTIIriWsvEnL3ZLmo6NngfSFxMYkbQSwUZDpF8?=
 =?iso-8859-1?Q?stZcy+2S3ZSMVeQxh4pRq8PMyD8X64arGbu8ivCjtaf4IZjiGa/hTDtcnz?=
 =?iso-8859-1?Q?IjL4wfs5DJ4LeEra28LlE3bY+dxyZXTQSnMufZdtAT5U3Qvjx88CGMIQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YwuswgHu45D1wDfEZ2RogQNQKQqM8VU58FOzBGX+F+MYsHy/zm9VqkJbKL8l0IFxwW+Bdq8W9Dh0SqWXrsry79PVJ9zdToPELPBJ7MvAR4+MJbqwYAQdg84fI/0nKjm4Dn3tyA1ApNokDk24fdMVb9lb5HyViG7Wdjo+wATtGvEWNlmqxE6hJOKqToj7oeazpzviivmxm6bt5AxMVqAiHrEmuPo8ROaVXRlkLfssm/SARIj8Htf9CGkX1Pehi2YW7VKl+8ilsN8NDEf9fKzv4LRBWbxciNhA+VXA/B6RnVqV8uxKVkahwV+E0rp9LzEGPmFqt1NTiboqWNupwQ6/3kGngp5dcpfeQbE0Hszamm4mSOT8uKvTlALzIbcdl9IQaEBltnEv9inDb+8ZiOmocqk4iireKBFEeu1IVG0oA6cz+V/vv2R4dW8LnLatSizi+zXJ8nYq+JtYQurIOAmvHCHAV+ckXlBlU6mSPewvwbg5egHlCHM1pej2gpbDUVXaKmHfoe8jk6rxhVK+bBXFvhz92ToUhCwvbUnSVhJkjU3ZtmNNr0t6dgjWJmP6h4TDzhgQ+PmLDO+bc+rokRmytmX+T8JKWgpDnHdVtF+OLZg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f12be0-b5ad-4712-f81d-08ddfb09a0a7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 01:28:12.6818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfiS3oD6yVrl+sfZbhHI2X1fKAT9wXpiYxBupOduNeFEvu+pl3nxub9/Q8cx5b9Aer9NQ59jOA66ryyjaLQ0f/mvQscDFJdkqwQ5Ibhbkas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7028
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_07,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509240010
X-Proofpoint-ORIG-GUID: jbEBEZVVznTANbN6zThYJ3ZeLdpBxq01
X-Proofpoint-GUID: jbEBEZVVznTANbN6zThYJ3ZeLdpBxq01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyOCBTYWx0ZWRfX2zdUqEWrCdqi
 1NubVovp7mC7WPnY2PL5MlzZuPOxU6KkpVGe2R6bd8kTOQMv5GTIL7HuU2aU1jhCJ4iRKk4vAS+
 PYzBWGAJFsMKFTh92zqNm9T5xJ0zVMM4GwOMK/2QQoN3jbpnhXvIdnl0FHrUVCAJomLZCFn57gA
 eTiUfvpTlEXHt7f86DLGSrVX15vQ/FNaYeSm7EABu6xzQOeDwi4EwlflPyTGaJXg045Ss6EdqDM
 1oX+0FbAWxUzrMrBjBWM6o6m3E2N3jfdshj2ayJU7XRkfwDt/iTo3cjMDdHRSqCBHvBrFv6n0Tr
 j9f7PYLICTVanJankWS9Vhm8m2yjO0NSPS7Enf+h+mwD1+M2L5JBmHsFeoqLX6KvN1G++/W04rj
 ZiAA0yx5xy9thyQuek1OaXogQMRWUw==
X-Authority-Analysis: v=2.4 cv=HJrDFptv c=1 sm=1 tr=0 ts=68d34931 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=4ysvAfdgvZmxQNY-3ysA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:12086

On Tue, Sep 23, 2025 at 06:30:08PM -0400, Eugene Loh wrote:
> On 9/23/25 17:05, Kris Van Hees via DTrace-devel wrote:
> 
> > The "and %r0, 0xffffffff' instruction does not actually mask off the
> > lower 32 bits as one would expect because 0xffffffff is interpreted as
> > -1 and then sign-extedned to a 64-bit value, i.e. keeping all bits.
> 
> s/extedned/extended/

Thanks.

> > The "mov32 %r0, %r0" instruxtion does correctly mask off the lwoer 32
> 
> s/instruxtion/instruction/
> s/lwoer/lower/

Thanks.

> I started looking at this a while back and was not convinced that the lower
> 32 bits were what we want.  Do we want them, and do we have a test that
> confirms?  Or do we want the upper 32 bits?  I got distracted and mothballed
> the whole thing, but the test involved spawning a child thread and then
> looking at its ustack()...  maybe after the child had exited but before the
> parent did.  Admittedly, I was confused at the time, and I'm even worse now.

I leave that to you to decide :)  All I do with this patch is accomplish what
the code claimed to do (but failed to do).  But since the consumer only looked
at it as a 32-bit value, one wouldn't notice that the top 32 bits of the 64 bit
word were not 0.  In fact, with this patch, there is not a single change in
test results because the code never would see the higher order bits.  But since
I plan on using those to store other info, I do need this masking to be done
correctly.

So this is a first step towards that.  The code as written was a no-op.  This
patch fixes that.  Without any regressions.

And no, there is no test possible for this because the lack of masking would
only be visible if something else was significantly broken in the consumer.

> > bits because it forced the value in %r0 to be a 32-bit value.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   include/bpf_asm.h | 11 +++++++++++
> >   libdtrace/dt_cg.c |  3 ++-
> >   2 files changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/bpf_asm.h b/include/bpf_asm.h
> > index 152d2312..63987e01 100644
> > --- a/include/bpf_asm.h
> > +++ b/include/bpf_asm.h
> > @@ -36,6 +36,15 @@
> >   		.imm = 0						\
> >   	})
> > +#define BPF_ALU32_REG(op, dst, src)					\
> > +	((struct bpf_insn) {						\
> > +		.code = BPF_ALU | (op) | BPF_X,				\
> > +		.dst_reg = (dst),					\
> > +		.src_reg = (src),					\
> > +		.off = 0,						\
> > +		.imm = 0						\
> > +	})
> > +
> >   #define BPF_END_REG(sz, dst, dir)					\
> >   	((struct bpf_insn) {						\
> >   		.code = BPF_ALU | BPF_END | (dir),			\
> > @@ -68,6 +77,8 @@
> >   #define BPF_MOV_REG(dst, src)	BPF_ALU64_REG(BPF_MOV, dst, src)
> >   #define BPF_MOV_IMM(dst, val)	BPF_ALU64_IMM(BPF_MOV, dst, val)
> > +#define BPF_MOV32_REG(dst, src)	BPF_ALU32_REG(BPF_MOV, dst, src)
> > +
> >   #define BPF_LOAD(sz, dst, src, ofs)					\
> >   	((struct bpf_insn) {						\
> >   		.code = BPF_LDX | BPF_MEM | (sz),			\
> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > index a8f2c9d2..28b7e7c4 100644
> > --- a/libdtrace/dt_cg.c
> > +++ b/libdtrace/dt_cg.c
> > @@ -2757,7 +2757,8 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
> >   		dt_regset_xalloc(drp, BPF_REG_0);
> >   		emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> >   		dt_regset_free_args(drp);
> > -		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_0, 0xffffffff));
> > +		/* mov32 %r0, %r0 effectively masks the lower 32 bits. */
> > +		emit(dlp,  BPF_MOV32_REG(BPF_REG_0, BPF_REG_0));
> >   		emit(dlp,  BPF_STORE(BPF_DW, reg, off, BPF_REG_0));
> >   		dt_regset_free(drp, BPF_REG_0);
> >   	}
