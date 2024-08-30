Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526A42572
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 00:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724979297; cv=fail; b=lF47Yz2CnTSZHJdJXW+hZRk7B1G45CuCONatfxjG1lm5gZEckv2812Tu8Xja4j2N7bozYpHXdpVZRTvOr/JxfP+Oj48DYdVqgZfELw6jnhCn4hHNTlBE6k7SRHJY3INQeU5RZ8GVdXg3zkf239sfrV5/i65gTIVOyrZQgpQFF+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724979297; c=relaxed/simple;
	bh=wzB2n208R82Do4iIrPzgTUtJHwf00DlpqP6v4dh3c4Y=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lPaNynaEWq+2qnkaScbQlRdiims1PlOUMRVUf859OMzsE6c0bwAn+0vm58bZcrQ8cSWR8Se/caN9MIKy9ADMiWxUNw/Ozihn+R1QeeY7eKdsYTv4QqNLlgZ1NgX7cayHMGQzKqlkK/GPnGGvDwKvv8VvS3U1dYkdWKvxdlOeTsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MKhvKLig; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=egYtN+mo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MKhvKLig";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="egYtN+mo"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TLtXp9012141
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 00:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=duhHM+WbFEO6LpgX7v2MpS3UXfaqGfkLDbPKN9iw1fw=; b=
	MKhvKLiggVbfw5yf/Eoik8RC3Uyx3gPoV8Hlg1NvJYAc3BaNHxrVUwUq3rDU3ITl
	1PHT4SUDt3hFNEOh8G22neNq15RC/74tFLC+Af842TwxTVuA5A2iO6FChoE3BVgY
	x3Vuu6xjYwrIN7OOidC4gVeZr34JHES0vMqMbw2EM888WLka6D3g1ELGSiudeNh1
	6CT9nQcJ5utivQMZJZWnssaH815PgjZXPEd7/gpgVEpW16WStLUHmRcw86kBG8G4
	HtEFt+1ZzK3RReBGYjrzZnVkxcBMQSwt2CqbTVJ/IJSoz1xLsgav4aoiJ9FFT8wO
	7Os7Wm9RobkwynGbXJ1uRw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pugwkkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 00:54:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47U02eBq010469
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 00:54:52 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41894rejgw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 00:54:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAbCS6zPMKuoiE4MOZCYaRABOQj8IELDmM1NsxhKZgeWjzezljGeaRSUAcJJX11/OKu94/GvdE0lxLV4SMQFO4rcuqNjkkxOMMhk2fs3GNkvDHzvUxEsY0tBS+OmeQb2LX0GNbk7UTJl/bWCWcM16RD1fVwzxQ4NnbbWsNvnRHU8ETmqp1am9iTmbIwIEaaL3hRbhc5qXQ/Fp9UbnTT8vjOksM1jva/s/Pum888Ir3Xjyb2Vqnq6uU5JB/LlFzoliudjOLUVeiMkg8tIHIE+OxgBKoUk7cbGs+hVMI4tmLJh7JQc76Lzf+XT39Itn9jon89ynF2UzHwZm3XK83fCpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duhHM+WbFEO6LpgX7v2MpS3UXfaqGfkLDbPKN9iw1fw=;
 b=Sczw9CQdORPkp33NC0DI9BRIvirBnN4miP6ycPq8UDGR3x7L+ICi3PozUnEt0DLlGMq2vBCoM7RChJ3dnW22k52qHuIChAlBxhE7PuRDEPFlXvd80xpxwIOsgFPsoTOdMQYB2+XDRWe6tgu4e5SM9OvQfNEueok3q9MrpSWwPNDoivqIyx2Dgq8fwMYSYRB/ieA1uU8wamMdVBzRr5CNYcmVhTyh3RZoOY4QO6A/NZFs0ZpCY8OsurV0aqpItNPeFqoWMAByGv6AhqaHd3f4LbrPFEvaVwSfKOTKy9WU+kez9NJdsqEvL+DkzD9vAeTpAEkA+rRnp9cowtHoo7Ogfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duhHM+WbFEO6LpgX7v2MpS3UXfaqGfkLDbPKN9iw1fw=;
 b=egYtN+moiY0vCF2m5lqREEfJLBWvo6nUA7SmvVtYAbzQj5tuyZkpAdHm/WrW1QgUsE03zDcvnGPXOz7LG1BU79f1PItFFUL+i5KSBt64rc4ETSTiGWRnqd9gWyEBfeTyXNWddD9vzQ9mBTD5jP05i1wUXQaI45suNFIPGQQ0j1c=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5023.namprd10.prod.outlook.com (2603:10b6:5:38d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 00:54:49 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Fri, 30 Aug 2024
 00:54:49 +0000
Message-ID: <01996fde-0909-57a0-3178-2158b377f53a@oracle.com>
Date: Thu, 29 Aug 2024 20:54:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 31/38] Fix dt_pebs_init() call
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-12-eugene.loh@oracle.com> <ZsyRbgnYtFelMhM8@oracle.com>
 <9ddcccb0-6ab3-c1ec-5394-4793ac187273@oracle.com>
 <ZsyrTYUHihmORaU5@oracle.com>
 <9a232070-92da-3d5c-8337-52286fe66c4c@oracle.com>
 <Zs+Tm8LO6naCCQz3@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zs+Tm8LO6naCCQz3@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0605.namprd03.prod.outlook.com
 (2603:10b6:408:106::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5023:EE_
X-MS-Office365-Filtering-Correlation-Id: 93dda5b1-f928-4661-7ccc-08dcc88e59b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amlEd053Q1BQMmxUcXZpdXMzaXNvSUptTE1FZVhzU1k3NUNYT29zMWhiYXFw?=
 =?utf-8?B?ajBYUFZOZHRISXVTVlgyZ0lYVU14Ymk2Z1EwS0tZd0Rnekp6UG90azB1c0Qx?=
 =?utf-8?B?NTBNRzlnaWFIVHpIMG0yK1dUMjlVVVV2YlY2MlFSY1BWbHZoVnNjUWx4OCs2?=
 =?utf-8?B?TnArelVWSUtjNGpnS1NSbjg0TmJHQ09ONkNscC9zNnM0YlNDVGRQS0dTa0xv?=
 =?utf-8?B?NHZxTFNGbVdIM1F3dDBJdW91OFMveCtpQmlmbTBoVlpobmIrMzBhL0VEK25L?=
 =?utf-8?B?YldaZnVCSFdvbVhJaFpFQjZjckYyZlJFb1VXY1IvMVRtQ1psaXlkK2FLVjdH?=
 =?utf-8?B?RkE3RW13QldCTGljS2xSM1BCMTgvZUc1TDlFOWNxN0JEdGlsT0hlMjAxY2N3?=
 =?utf-8?B?RllkRTBIWWhRVFRUcVErUm45UnNGSjdtWUY0Rk9HM25wY3J5NklTbzVTYklR?=
 =?utf-8?B?TnpDTzVTWnlNSW4reGlEU2gzYllQS00zMCtMVVFSZzBDdEdxeWJTS1QyUXFI?=
 =?utf-8?B?NTR0WWJueklsOXZXS3dHN1NOVUVGbFZkVEthbHVzcmlSQk5wenNUSUxraDJm?=
 =?utf-8?B?NW1HanMxQ2dDQjlvcEs1YXdhVDVic1hjNmJ1OU5wOENLNFgyeHlxZ21LY1lt?=
 =?utf-8?B?dDNmUldpYm9MaEFrQjFHT1JDWXR6bS93QmZNclFmTWZEZFVkcDFsb0NXeGw1?=
 =?utf-8?B?Y1paMUk0RjZScUtpcWRMdUlYZ09hbjQ5d2UvclVidzNIMHI2UndqTzFUekV2?=
 =?utf-8?B?bllnb2ZrSjVJQVpIN0FEM1hsR2hVRGFDTXZNMkJyN0hBbkE3eENRUVlYTjBQ?=
 =?utf-8?B?R0Fsa3pFdVBja1JSR0phcmZUVWpOVnRTYVNqdnhEWE0zRlp1WG5halZENFBp?=
 =?utf-8?B?Vm1LU3hqa0FLR1lpZFZuNmI0MkorOFVLTmoxRGFwdUNKaFdBTUtOQ3NITXA5?=
 =?utf-8?B?djdEcm41YnhMK2NvT2FDWVBhQXhNR2xKSkVEYm1hYm02Y1NMQnloU2FBWE5O?=
 =?utf-8?B?aDZZWVFRYWFSeGFnbG1BQmZOaHk0b2lxOU1KVkNHUTJLLyt0UUhlV3BLbEND?=
 =?utf-8?B?aGRIVk1Hc0pXbEI0MTdoZnVQZEIvbndsWStVSXJVN09waG1HdXpyUHdzb0t5?=
 =?utf-8?B?QmtoM0psQ0d6L0pkVmNqMlRyZ0NST2JZQzRlbjdkQmE1a3ZkbFdVTHY4TnM3?=
 =?utf-8?B?SURJWFk1QXpSd0xmQkxHWTFKTDh2MHMzK3Y3QUw3R0RvOFc3b2JMNTNBQ2c2?=
 =?utf-8?B?RTlvOE1RS1hsMitucXUzL3hjYXFLbkdiVWtZUkZFOUpIc1FDMlNJRnd1NFZ2?=
 =?utf-8?B?bi84R20zbWdyd1hsL25LUXdMNWdoUDArSTA5eWNVeU54c3piYnFuLzg1alRZ?=
 =?utf-8?B?eWIwVWl3ckJyanJPckEwNUk3dnQ4aFJiTkdNdHI5VWxCRlhhMWt5Y2RMc3dj?=
 =?utf-8?B?ZXp0TkE0MEVpNmhFUndlQlJTQzVLVHV5Q3hXYTlCWVVMRU9kNzAzNmUrVmN5?=
 =?utf-8?B?WmxiNFZTRjMwcjJxc3Y2bVA5L1l1ZnZ6d0g3NHUyS01aVXEweTBVdm1yVndN?=
 =?utf-8?B?Q1oxTjYvZm5OTGxVUmxTNGpRa1JsdytNaXBYTkdtdkIzdU8rMEhSdklESlRH?=
 =?utf-8?B?bnhYeWZ1V3ZmRFFDM1QwK0t4TEhqeXRCUXlzekxpT1p4MndNZkNjODBsYnht?=
 =?utf-8?B?U25YdENZR0RXQkE2OUIyRHRtVjVLUFVzMUsvWG9SUnBtSW5ESDJua3ZQQlZr?=
 =?utf-8?B?L0U2YzFrOWt5Z1RKUXIwR1NiakFlYTdUTlZkQnV6ZTBFMUhVenlHMS9vUUgz?=
 =?utf-8?B?SXdKakJJN0ZjYjRpRUM0UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlRNY2F0OExpS040RWhLbFNrMEYvT1NndHdzaHpQSTRNdndvSVVVdjNQREFW?=
 =?utf-8?B?NUtaMUI4a1kwYkU3cklnazZCMGxyT1RIUk8vREJFeXdmSmVGdmMyNDBwTlZN?=
 =?utf-8?B?YzFQeUxJbkZUNHJ1Vko1WlN3NFFRcDZicngza0xhZmY0a2ZzN2U4WCtueG11?=
 =?utf-8?B?Z1Vxby9MUkRReDhmSVM2WWl4S0ttL2p1V3hqalAreFN6MFk5VllseGd1Z3Zm?=
 =?utf-8?B?ajhiQnAxRHB0eVp6OFB6Q0Z2TUN3NGtzWWhZYVFKRGwwaGN5RTc0OGF1bVFj?=
 =?utf-8?B?dEdENzMyTzZkaGp6Z3o0Y2pkRVdpeFRreG1uNUN1Uk9PVFJFNlUxYytrdlVS?=
 =?utf-8?B?d29RNmxCeUtwVWVqRmh6OFgrUm5JaFRrZHdKZFR0dEpqcVp5U3FUQ0R3ZENO?=
 =?utf-8?B?MDN0Wk5ocXo4MTRTajdYMVNOb2cxUTJXc0IwQVFuWXE0cUhQU2oxSk9tV282?=
 =?utf-8?B?Tm9BSUIyLzVQNzlqaEZZbUMxb1RzUWNTS0FBR1R3dW5ia1UreXZ0S0lQM2hM?=
 =?utf-8?B?Q3JkYmppUUpaMGo5MHgrMDVteGFFQ3QzbEJEakVMaWxDVXJhRzRHRkZZMUZM?=
 =?utf-8?B?bDBGRGJqNHVTK1duYzlIVEIzRUNYVDhPMnZwWkM1djk1VTlVL3lLa1ZyOGVt?=
 =?utf-8?B?YUl6SU9BTTE5NzhkRGNTS3NEVlJFM1AvaFM4aVFqamV1aGNuQWFwYk9IaWMy?=
 =?utf-8?B?NjRQeFNRMng0dC9IQ0l0Y0hrRUg3SW45V2VKMk1GSEZtdzc3MXJFR1NXKzFK?=
 =?utf-8?B?bGxhbktaaXhZdWM4eXZEMVJiTnFvRkxEOWR6ZUlqT2VLM1V1UjRGMlBhT0pW?=
 =?utf-8?B?Mjl0Q0o5YnJQL1JyMTBHVzZJYkh0M1V2OEUyVHRlWlBZdWF6bzdjZUpMMi9C?=
 =?utf-8?B?MEo4SE5pRDBjTWhkUkRub20rOWJLTDZUOHN1K2hzZ0h1V0k4aGF0Y2kvRkVu?=
 =?utf-8?B?aVFncFhKT29WRzZIODc5SEtkYWJkR2JHZnIwZVBNdGJaUDNwU2RNL1BaMnk3?=
 =?utf-8?B?NFp3eXRUdkU4VGZIbzIxd0NZMjFYMFR6aDI0ZFhkN3ZybmhNRzloKzhNM0Rm?=
 =?utf-8?B?eHR6RW1LdkV0VFkvblduaWZQcVEvM0pQSnVKeXJON3YzYi81bFlpV3FQYmxs?=
 =?utf-8?B?eXJhUURpazhRcHpsSnRCKzZtN0E3T2xJWUFKY1FVWXlqT0hGY0tUdkZ1ckVi?=
 =?utf-8?B?cnAxMzl6ZkxBVGRnUDhhUlJmdWp6QkhoRXRoeWphSWNXdzZ1MjdHeHpTaUdR?=
 =?utf-8?B?blduNkh4bE1BeW5ZL2pydHc5Z09mNFFmMkhqL2RxMWpYWkFvb3NCL08wdjN1?=
 =?utf-8?B?WEkxR1NQYmFSQXpvalYvNm8xZGhjQ29RQm0wb04wODRGaEFNUUtXaWtacUhU?=
 =?utf-8?B?blYrV3ZBcFpsa0RkNVhVS2wwNm8zREhpeW5Mamp4TTlsV3NLNXFjR1Voc2Vy?=
 =?utf-8?B?cnZzMjVvU3Y4WFlwUkRXWEFtYXF3OXA3V3hMN3ZuWnAzRnVRd040M0RuLzBt?=
 =?utf-8?B?S29leEluKzUwYS9Kc3Y2T1VrdmJ3ZFViVWdNaVo1YUljVTFiczF0Vk9McUFz?=
 =?utf-8?B?elpuUWU1Z2NWKzlXSDA5UVF2WEl2OXJLYmlMWSt3c21zUlN0cVpJSnltQ2d5?=
 =?utf-8?B?bWFOY1ZmdCtXbFJiTkF4MjFtM3pYNXY4YkxnVDRac3pCdDNjOXBDQ1lOUnh2?=
 =?utf-8?B?a2JUM0Fwb3dDTXFnZ29ON0RsNjdXQTF6amQ5VDV6NkJoSlBCaXUxelJqaXlu?=
 =?utf-8?B?VHFRaG94Q21IYmFoakxLS2Q1VzQ1REFUaFRpeW9VOXRyNEhETjB6NWJ2c3dI?=
 =?utf-8?B?OE82eTN0Zld1K3J6YzZKS1gvYVE3SWk5eUxLMFNZTXdwTTNPVjFPRHNIZTF0?=
 =?utf-8?B?R0xEMGFvYkc0VFY1RXVYUGg1NXZUZ3FyRFRMQThFOGhIQWNtMFVYcytCWUh0?=
 =?utf-8?B?MU1EUXVmbDVLYkVSOG1BSWZxc0lxeVRqNTl3UUQrSWFUcndVZUFzenRWdTVk?=
 =?utf-8?B?YnRtRGZCYnVUbFJoM2lxN1BRU0E1Ly8yR0pjNzdodlJqMVFzbUJvSHlGRDda?=
 =?utf-8?B?bGcycGVRMlNIcnoyMktxcmd5cUttNkNacnpHT0JiamNuVnFzaU1nM2xWaXRN?=
 =?utf-8?Q?9+wpI7c9QSY44RrWf4rphT6pn?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W8vQS+28wHq15yt97idAstAgMt7rKed3K7pSCs+S6NwEXQJUWaoQbEQYc95I6M6JkGgw39N1T45cLzaSSvXIIGKe8gYlfyl6CptXQyXmpMpYcXBnkWlHZGwR48uLDNnmp3ZUdrTHYytN8+7P7qn36TPWp6OQy+QQl3ZnKWLzTamoOlBr0dReLSPmCYId7r35iRUzHI8rv+BDsPmttFrS6h+2Q9pPakhjnhYcczTW2nZhhUPyV4RETpDC4QGOSTjG3Hu9GxmQ0YtgN0NeluLv0UmQlqAbFSQek2jDqAkPLk2WTirMc3Pg5O56sLzQqIUhGp/eFrXVBw9CBloHRZ4i7FL7Ib5EZ2smTYgLNIy7eElEDHluguJIQAMMxefmnAnBz2w8vjzPavhxDwhEYA/ohG8BaIdwHpG1Pszsebr3iqtNg5ZvmgKyBSWokdvv6l9aajIg70aqgXrJZm3bAeUkMxipcXsBgsNqrag1LlMZif2TnZ4gJK+ZWEpU6DlN/Oi383jCdu+9yjryAAEFdua4J+MWG0FZ6GBUTr0Z3rwZLyCfEGkjswm43+S3b69NtjEOQxcB5RCD+7lutv4ygKFqcHK83VYPJyRDXfKci8G1E/8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93dda5b1-f928-4661-7ccc-08dcc88e59b6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 00:54:49.7140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5b4xmhY0ehgC3YhEXLqJ1UvS5LhN3IkLcLU+q4/7txISVZ9OY20+XY73cl3Fb20Y1KzhG+PfM2ys8O24vD/pTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5023
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408300005
X-Proofpoint-GUID: wOlYrE3U4F1PWAZU0RcT3XOgep_8qdkm
X-Proofpoint-ORIG-GUID: wOlYrE3U4F1PWAZU0RcT3XOgep_8qdkm

On 8/28/24 17:16, Kris Van Hees wrote:

> On Wed, Aug 28, 2024 at 04:57:43PM -0400, Eugene Loh wrote:
>> On 8/26/24 12:20, Kris Van Hees wrote:
>>> On Mon, Aug 26, 2024 at 11:42:25AM -0400, Eugene Loh wrote:
>>>> On 8/26/24 10:30, Kris Van Hees wrote:
>>>>> This patch goes against the intent of the code, as far as I can see.  The
>>>>> point of performing the size check prior to increasing the buffer size was
>>>>> to enforce the limit on the size that was explicit set by the user.  Then,
>>>>> if that size was sufficient, then DTrace is at liberty to increase that
>>>>> size to a whole multiple of the page size.
>>>>>
>>>>> But if I were to insist that a buffer can only be 24 bytes, and 24 bytes are
>>>>> not enough to store a single trace record, DTrace should report an error
>>>>> rather than increasing my bufsize setting on its own.
>>>> The point is that DTrace *does* increase my bufsize setting on its own.  Why
>>>> should DTrace complain about my setting when it's going to ignore my setting
>>>> anyhow?  What value does the pre-existing behavior offer to DTrace users?
>>>> Are you saying that DTrace should not resize?  That it should honor the
>>>> user's bufsize?  No more resizing (to page size or whatever it wants)?
>>> The main point of this code was to retain the bevhaviour that DTrace provided,
>> As far as adhering to legacy behavior... quite simply, we do not. We do not
>> set the "principal buffer size" to bufsize.  Further, any legacy resizing
>> behavior is, if I understand correctly, to go smaller than the user
>> requested;  we do the opposite.  Looking to the legacy behavior for
>> precedent is pointless.  The situation is that we are unlike legacy behavior
>> in fundamental respects, opposite in another respect (automatic resizing),
>> but consistent in some impractical and useless respect.  That consistency
>> strikes me as small consolation.
> You can look at this from different angles, yes.
>
>> There is no documentation to change;  the documentation is already wrong.
>> This patch was intended as a step to making the behavior something that was
>> describable.  Clearly, trying to hold on to a legacy buffering model has
>> produced a byzantine situation in the current port, which treats buffering
>> very differently.
> Yes, but if you want to go that route we ought to go all the way, and not some
> interim solution (see below).
>
>> Perhaps we simply disagree on those points, and this patch is DOA. But the
>> patch points out other problems as well.  E.g., the min computation wasn't
>> even right and error checking was wrong.
> Let's do this as two patches:
>   - one that ensures that the computation is updated to the current
>     implementation changes and is correct
>   - one that provides for increasing the bufsize to be the smallest multiple of
>     pagesize to fit the largest trace record needed for the tracing session
>
> I don't think that checking the rounded up bufsize against the minimum size
> makes any sense if you are going to increase the specified bufsize anyway.
> Might as well increase it to fit the minimum size altogether.

I'd like to understand this proposal.  Are you saying:

*)  Determine the min size (correctly).

*)  Round that up per perf_event requirements (2^n + 1 pages).

*)  Ignore the user's bufsize setting.

I'm fine with that (given that we do buffering so unlike the legacy 
implementation and will not be honoring the user's bufsize value 
anyhow), but I just wanted to be explicit about ignoring the user's bufsize.

>>> which is that if a user explicitly requests a bufsize that is less than the
>>> minimum required for the given trace programs, an error is reported.  That is
>>> a mater of being consistent (even if it has no practical application that I
>>> can see).  Tests from the existing version failed because this was not being
>>> done right.
>>>
>>> As far as functionality, as long as the bufsize is large enough to hold the
>>> largest trace record, DTrace can (and needs to) ensure that the buffer size
>>> is a whole multiple of the page size because that is required by the perf
>>> ring buffer imlementation.
>>>
>>> So, DTrace only increases the buffer size to the required multiple of page size
>>> if the user supplied bufsize is at least large enough to hold the largest trace
>>> record (or if no bufsize was explicitly specified).
>>>
>>> We could opt to change the behaviour of the bufsize opton to always round up to
>>> a whole multiple of page size, but that is a deviation from the original
>>> implementation and thus is something that would need to be documented, etc...
>>>
>>> Aside from the computation of the minimum required size needing updating when
>>> patches (e.g. the USDT changes) modify the layout and size of the trace records,
>>> I do not think that the existing code is wrong.
>>>
>>> I am certainly open to a feature change to make bufsize always be rounded up as
>>> needed, but that is not a bug fix and I think that ought to be its own patch
>>> (along with documentation changes etc).  And it might need some more discussion
>>> because it brings up the question why we wouldn't just simply always increase
>>> bufsize to be the smallest multiple of the page size to accomodate the largest
>>> trace record.
>>>
>>>>> On Thu, Jun 27, 2024 at 01:38:57AM -0400, eugene.loh@oracle.com wrote:
>>>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>>>
>>>>>> The function had a few issues, mainly with its comments,
>>>>>> ranging from typos to incorrect descriptions of behavior.
>>>>>>
>>>>>> The function has only one caller.  The enforcement of a
>>>>>> size minimum was problematic in a number of respects:
>>>>>> - it was missing 4 bytes
>>>>>> - it was enforcing the minimum before the size was
>>>>>>        increased by the caller
>>>>>> - it was checking dt_pebs_init()==-1,
>>>>>>        missing errors with other negative return values
>>>>>>
>>>>>> So change the function to accept a minimum and change its
>>>>>> return values.
