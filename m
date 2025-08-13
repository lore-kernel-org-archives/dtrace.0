Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325652FD7B8
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 20:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115874; cv=fail; b=PZVCTqtYi3sjFYetETZiO2tV4XeTWsOvm1YcNnxY7otKy2K5LYWiqyFgVkKpqmbrLhq0Ksnirinl6oLfT5AoC6UzPzX1dIdoUdUP+GDSFAvJx/cOAqjB8FHIh2Pykb31Xuo+3/3MiULN8RkEJmmAX3LZ/JcanaOQtod7huQ7PRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115874; c=relaxed/simple;
	bh=kdKgZWFqP/dRkv0/OMvKM4ITfCfVVnV/1zKkBufAFG8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LqpIxE12kYS6VKeMESJcim0Z+oiPb0IYv0T5gXnFXqoRqBo5BryJc70aXEVYh1BRcos7nrDz3WuwjvKdRKgLMig8R6VsLlR6BpsZhjxy+Ys1K36N+hI1gPXDSAG+nbCV8IapKx6tBcNISwTO5au0HR7nSMmjs/5UkN0+h3eFhBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H/UWftb2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PlpK1q0p; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H/UWftb2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PlpK1q0p"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DINNhC001580
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 20:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=n/UlWNR4HkcvGaXQjXIlUW9urC3Ow5OoKCnPCn+kgQ8=; b=
	H/UWftb2DQtrax003+JlL2BjQyzvzyFs+kxouFiBKyJp0z/M4HD6L856BMCt1uNr
	ENJhttvPpLvHBS1ujDqs31+FOdojObGwgqGYeUINUfhUkAKOk6hdJN/oT4Ee5odC
	en9rXQ36OrJFVdvIXCQjJt0llY3qvaIuIN9fztMm8m3PQ1BcC/fyVZpIJjS4Uddx
	ensBpnYloRY2T0mSXiTZAJdTbs3uSbjqLUfiLhy5jav9o8joT6rI2z7v6IhpRpKF
	VSELxu+lLRRvXUirtIaxRYmvUBGlOOFKpNqsXwcXlZmq8r2EsQkAITNBjGfFswtn
	xVvWZ5JAsQFyGIV3N3YzEQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48guch8vu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 20:11:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57DJ7nMR030019
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 20:11:10 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012028.outbound.protection.outlook.com [40.93.195.28])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsbv80p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 20:11:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5LKrgB/EPCA1pMbHzD4TU6c2/bhSKMI1l8Hm14z4GjZlmSmNEnePM6+qj5WA+/aDJwmrUJi0A20LOVVx5jOFPuFRZuXO9sD9Jqf72BkO2yydz0BOKv1X8q+dZyXClakJvOwP/TDmEps//Lwmw6VofZ3G7f1rn4+8zdGjMnkvrl99YzUR/yttR4XMp0UZkIY8AadIsWs/kIdbBvDk1M8ej95uQoJP8MAa5noODg4JgFrMZIr8/hU8e9Pttkfa/AL/UyAUSMIV1CbZ9598EL+9FPecrYkhjSsf+DKeKZ5euxhx06XQxFdNCgc3SQALnMHZ7aJqIIthFn350edlxXwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/UlWNR4HkcvGaXQjXIlUW9urC3Ow5OoKCnPCn+kgQ8=;
 b=Pjnc78hp3XgIfDmZNhrppACatCg6OvFmLgfUMBXoQvYJtK2iiR4Wg1UFJyiEvFaZyThSVIWD7ukRM54P8+9Nea1PhkogDf9j85ykDK0rOUW4jXGQ/IPYjOP6vc+3kYo2flIVBjZiW9inW9rK7qdWKRC7kKEQZnKaO/cN3ADddWI4G+SDLRASH5/wd0zs6vEwgbTXcAQpxyWuXUR2GKIOyVY9DjJNH8x8jAdD5NQxpTHw6eyE2ExQ01pFOddfU+XGXNK4Pr6kbP1SfRUmfdjq/VovNzWuVZg48q/lY9ajGNmqXcNmv9c55VaQ+ZY+BuK0XcKiEeqh4JXbPvAazSu1NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/UlWNR4HkcvGaXQjXIlUW9urC3Ow5OoKCnPCn+kgQ8=;
 b=PlpK1q0ppRWUC6icTBtzOWGUqw4FsaTLKJMjbtFKZHLVgnEhRjnnB+ZD+5R3Z0ujpvUnEzPr3/fY8TzmSqQ6Jy/tRGdZo8p/7h+tZcpzAZBsV77MMBlGBdI4A2J3Jyz65OVJ3LlX/nO1RCdHOe/o0Yi9z/+V8mS902jC/L3OGzU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA4PR10MB8566.namprd10.prod.outlook.com (2603:10b6:208:568::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Wed, 13 Aug
 2025 20:11:08 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 20:11:07 +0000
Message-ID: <1f4c2769-7950-8f23-8817-0b4203d8db1a@oracle.com>
Date: Wed, 13 Aug 2025 16:11:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 2/5] test: improve test condition
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672EDF946CB1EFDE82D913FC22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672EDF946CB1EFDE82D913FC22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0023.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::36) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA4PR10MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: f2763c73-e38b-49ad-76ac-08dddaa589c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vms4Zk9QZDlPVTlJeFc0ZENVMzMxMVdUN2h3MXRaMWxZVHZ4cDg4a1JVQ0M1?=
 =?utf-8?B?dmFVbThXRkp1Mk9VTVkxZ1hKa21Qc2IvUUdCTEV0QlFiaTJKUXlSazY2YjR1?=
 =?utf-8?B?Z1VtNTFlbUVkeDMzbzNJQVZqR0cxMU1VcjJOR1I0bktueXlQanNQR2I4VTl6?=
 =?utf-8?B?bU56eDBERUNOd2lvMWtBSWkyU1AvZzBQbWxnWUdRa2JuM1p4WnBuYk0xdGlr?=
 =?utf-8?B?aWhpT05TM05oUHRPZ3BORkJJUlF1ajA1UEJzZ1dRM0Q5NFRWajRMdHVsRUtj?=
 =?utf-8?B?STRNaExmYWVnSzN4VmNJdW4vNEVuSjIycmR1aGVVcWNGZnVONFB2MVVtVEhS?=
 =?utf-8?B?SzFSU0d2RnV5eitYR3JFSHRleHBacWRhR0UzRHJKLzVaVzR3ekFhVEpWY1FH?=
 =?utf-8?B?aXBwMitJREgwVGFNNEVvYmFMRVMvWS9kTEFzdFBpdW93UlBqVTNnL1dzWitp?=
 =?utf-8?B?clpkWENXNHVhQXFRYmw3OHAwTTEyNFU3SHVuTXN0STU4L0hzdm5nZ3A5bldH?=
 =?utf-8?B?Y3B2ZmRUMmN0czZ1LzNGK3pYUlFJaGpqajc3WEtsMjhsU2hUYks4VDRjRHFV?=
 =?utf-8?B?S3NxcDVxOG05M3gzY3JvUncwN1RYRzlrN1ZpLzFlTjFrM0EwSzVSZlg5UlBy?=
 =?utf-8?B?QjdVZmlpYlcyNnFqMHNkbXdHKytZL3NMSWFHOUwxbm5EUUhxSGR0cStlU3o1?=
 =?utf-8?B?eFI1NzFZMlEwRmRPV1d5eFVNMmdIUDNQMmU0SUludlo4SXkxd0JhNXZ5c0lY?=
 =?utf-8?B?Y1VaVjVvajRud1owUTA1YWdvUHk4OE9YRm9zbGpHanB1OUJiNWM2Q1RSRjlt?=
 =?utf-8?B?cVY4dGMxY3I3SlJ6UGN6TlF6NUk5N2hqbmJ1ODNnTUlhaGdTeWc0MkxxY0xs?=
 =?utf-8?B?SWREQ3hmU2w0WU9GSFlBS3dCWk1XRHA4U2VOVzN0YUM0NGNsNDRmY3dmeVd2?=
 =?utf-8?B?MENGU0dDbU8rSlp3Vmh6amsvb0ltZjY1eGtPdS82ZEpkVzZ3cisyK3RPRyty?=
 =?utf-8?B?Uzc0UDhOWHhmL3M3WHh5Y1FMN0lkTkdSN0wxUktNeFAxOWtxKzIvTzF3VU4w?=
 =?utf-8?B?R2FaalVGbXY3b2VKeFNYZENKOVBuSlpNcTJWMXlhNU9OWVphanN5YUZBdlg2?=
 =?utf-8?B?NC9rQkNmQkkyNTBuVmlSb3RBYTF6V3ozK1B5dkJkam44OWxnS1lWcUlONW5j?=
 =?utf-8?B?QkszMi9kZjJlV2xXZlhuTFhXUVJqK3dOQTFPZmR4eTVFSTNON25CZUw2YlFy?=
 =?utf-8?B?RENuQjAreWVHL0JXU3g3dk1GMW9TdUVWUjhJM1VzSFZxVjR3YlY4WTR3VFZW?=
 =?utf-8?B?cWZZMm9wSVV2bEJlTmNRUjczM2dkTEZDNlhBWEtpTUt1bHROaExYVS93WFZN?=
 =?utf-8?B?ZDVyYkVOM3QrMnpqWGphSVJiUWhzMDR4VDYrMmRXYXFXU3B5djA1RUZLL05Z?=
 =?utf-8?B?VkJ0VXIvc1F2dDVJRlZkQ3VVUU1HcHI2K0xKZXMwOXlLMDVlejZzdGFOaHp1?=
 =?utf-8?B?SUFrQ05Pa0lCL3d6bHVyZHJkYXZOeHluKzZaZk16S05kckowNXZmMjZSUEVs?=
 =?utf-8?B?QmxVV3lzOFk1U0Z4VUpXbXlpTmRoend2ekRFdzZjY2JlU3N4U0JqcDdETEhL?=
 =?utf-8?B?eUthalo0a0lCdjRzQzdWNXF4MzU2cVZ2L0R3aWhPNXpTUUwxckRoZW9LaDZt?=
 =?utf-8?B?NDRkaGdpQ0loc2hMQWhjdndURnc1Z3oyaFdud2ZTb0FPVCtxa2VIem5sbmJF?=
 =?utf-8?B?dkt3TWZMWno5Tk01a2lMalRwcDBFK1JZbVhEdjloVExVSDVLN2g4QnY5RGpS?=
 =?utf-8?B?MVU3ZS9MSmdwOWxSei8zbW0vQ2JQNm9acHRteFhnU0tnTDB6S0ZHNGpUa1FM?=
 =?utf-8?B?dDBMVU5Cb3hISlFKaXFTN2NId1BZUXBIVFdNellTSUZRVG9XK25VSk1iSFFn?=
 =?utf-8?Q?vjfS3Xh2pss=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0kyV3M4WTd4b1ZFdS84dG1MOFRMSkQ5Zy8wd0xYWUtwK1hRNlNzM0JnV2NL?=
 =?utf-8?B?dDZJZHNTazFlaFQ2b0JWUlN3V29BbnJJcUZnek5CTjdma2QyZUpXL3VuNncr?=
 =?utf-8?B?T3lraytjcHpUOTdrb3NOZi9KV2lSbGx6ZnRFT0RJNjZ3ckxHdVRJZStkZkRK?=
 =?utf-8?B?M3VKOFB6Q09XcGNRVEo3cExoWTBHSStOVEdZeUdXenhXSzBGZ212VnlPZEl1?=
 =?utf-8?B?N2RySUlhK2NxN08vYlZQQWlDdjdIbWZNMGhQZFdNRW1WcVlGejY0RUhUMUhJ?=
 =?utf-8?B?aEpUSXcwSFhrZm5sUzJYLy80YzZobm9lUTZBVTVPcG5hQTczcnQ1TmxGQzU0?=
 =?utf-8?B?cnh2eVpoWHh3aUdDVGZhdGl1OWlFNTZaYW9DVmtiSUZwdEVIa0l2eDFjbDYr?=
 =?utf-8?B?dzRTNTVZSWZnSUpwZS9ycldpdys1TXd0K1lQKzA2WVdMNWZRV2NnSG14SFRY?=
 =?utf-8?B?YjNDVnVva0lLblNleENMdmZPdlIxbHdaa2ZNQlZvUEN4UWd5VzQyMjFYWTgz?=
 =?utf-8?B?TFZXYWJ5WXR0YzVFWnVqTjdOS3FhbSt4WEorSlVjWmNCVDBRQ09yeFRhSVIx?=
 =?utf-8?B?QWJSSzlKMWcwQUpqUnc4cmJNRnJnV0lBOTdqNDBVSVhCTzFvYkRyTW1zMmV5?=
 =?utf-8?B?dEpmS1NRTnNDQ3JLL3dkNjlkZVpEeEFSemxQOVhCaEM5RW5ObmJrUW1heGlt?=
 =?utf-8?B?cS9oZU5DcjFkRGFNdUYrVkZCQVFJNHpWQ29KSmY0ZFBheFpwNDU0ZHNmdWpm?=
 =?utf-8?B?OEl2QnNxQzJsNGhPY2M0YWZWUVcyS01Tc1YvQ1NDYjh5b1MvSVcyWFMzVlMv?=
 =?utf-8?B?TnhEeFozTHIyMVFqZzhGSXRjSWF0a21JWjh5VUxZQkYzckdiRkZBaEJqQ2ll?=
 =?utf-8?B?bXdrVUNueUJYSE9PL0Q4RDZaTi9xb253ZERjcHZyTkc1MTByU3hWUVE1T0hV?=
 =?utf-8?B?ODdGOGtCZjZrUUVHMlJ4OWhCdTJrSVZjeWdLVEQwTko3d3dYYTBtYitUNDhz?=
 =?utf-8?B?aDJBTjZ1WDkyMVVhR1l4dzBiVGd0S1J4NjlsSDF0UEdjYXdpR3d0bTIzWDB0?=
 =?utf-8?B?cHNjV0ZnNHNPalJ2T0hGYUpqckJPZklsbk1zQ2tvTmFBMGxQZEFBY3BoQTBn?=
 =?utf-8?B?U0M4NFJ1YVA2U3drdUpSbVpUV0dSd0daYmN1VlI2UTNiV05YWkVyYUt3bW5S?=
 =?utf-8?B?anQ1d1pTQ3N3djdTbFJlOFMvSEM4b0g0T0lOZTFZclZqamdhdFM2MFRBb1cy?=
 =?utf-8?B?UjhLR1NDS0JLL25uWm1RbDN2Q2VhSTRDL2tKVTBEU2hiSHRsVWxLbDJPSTF5?=
 =?utf-8?B?aUZBQXZ5NXNibEdIOWFObVFsSUFMa25BdFE1Rm81REl1LzQ0dkpHN0V3WWln?=
 =?utf-8?B?dWdHREdoMTE5MHllelVGaldLUkt5L1BBOUNhdEFsdkxTVlBJbjNzUFVzWGx6?=
 =?utf-8?B?Z3d2ZDNteldQQ0srTG53UUpBd0t5emJST1FxbmYxYkkxamJGc0FuUEFkR2tG?=
 =?utf-8?B?V3p3QU1iM0QveTZ0KzROQ0hOUTkyWFQzMWtyZlh4OGI0N2FocXcrNEwydE11?=
 =?utf-8?B?dmpwSGQ5dnNMQ0Z6UmZsSXQzZS9wMWUwa2JaNVMyb0k0ZTZsbkV1aXluM25q?=
 =?utf-8?B?dmJHdXc4M2d0d3FZY0FJa25ybm5FY0FXN0RrdWVhUzRlaFRBQjdsV3lraDAv?=
 =?utf-8?B?eG9xa3VKNlRRQTJ1dlkyOVR5V1JOQURlTVlEdU9sTi9Rakh1RDdCUzZ2alZK?=
 =?utf-8?B?cHNuaTZ1aGhSaEFTUkZZczJlcFg3dithZ3o2VzdWV05sUExmc1AxMkd1cXky?=
 =?utf-8?B?a3FnclBMaDMwdHcyc0tWendUelRwZXhqVlF4d3Jxd3hJRnJwZWd3Z2t6dEVL?=
 =?utf-8?B?czl6TDFEenJpa0FzeVhjdXlXSUdwb29kOWFtR1RidTY5S1dmS1dtYVNpdWRU?=
 =?utf-8?B?Mlo2Q0ZlcUdJQ2NXaVhFN0llWlJla2tnelJLcjkzWVBZTTZUNUJFWlhsUnJK?=
 =?utf-8?B?SFIwZ25IMWlnenNZVktLYlR1Q1dRcFU2dWY3RlZqYS8wcnptU01tZkNZd0pa?=
 =?utf-8?B?SmxiL3kzNlNCM2FqYjVMdWM1YVB3RTFLTENDSGh4WnVsN2dLLzhldDlHRERM?=
 =?utf-8?Q?W5OwT/jR2tHO07bNk5KjdDbus?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dfq5LmlnDFk+ofdOPGV0tLt+R62DFIJWDgmjvtHxP6EOhgIs+SK+fc/SNYpxBSsc0A8MSkg0PPW9tp0a6h/P8ISxrDw7yAYM9s3G55JMukqipouiS06/pbEISNMGFWrcFVfN2mH0xLB9g2wL165gl3wB3rWldtMJ1cf8EgXfHvsJR5xiOtoXDHCuqgPz1kp8pMaYS/yFxRY3K6np7FgDcYowieYQn/AYAglcyIu7iiFdYfXGTvnVBPtrLctWZhWJNh+Y0THjw7pKOkG720GrLSzIhXhf7kdoyiUOkUYCw9ExWhUp4m4pHuDyv7H/yQ/a60Vty7PDHPWwjyw0kHIg33JuTeRfxTnIWnpWzoWu33CmYRrYPwgWNTdQDKSFGJqoyNwlcB6rX8aCGdU40AofJ1mkmHM0GDPNGxi6a81P85Ag+Tja5PoHfq/BXs/Nuns1fsiyCskjTnwDJKH8F4kbBBT16ABY74MZYG0sCerPCUqM+A+yhf49UjceenD/6ueSNxJQWsqr5X9Eo838qNfzuWsp1koaNbsBpLUz1zIx4icpSLJcnCcp0joQTrxb77JlitHm2TguezBC3VKP7Kn8pTM1LwddDSakuVUXLWBjAEw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2763c73-e38b-49ad-76ac-08dddaa589c4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 20:11:07.6000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDTH2AiwmOcV8y2EMJn4xeTqjaB4Wq7ohKVPhb6CRQ8vygOwmsVILcbwCDy5YgzmVRUyctttDFFTQXSKW1utKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8566
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508130187
X-Authority-Analysis: v=2.4 cv=Eo/SrTcA c=1 sm=1 tr=0 ts=689cf15f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=PhMilpOBs-Jc-KeNvJAA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: qp-Lo-RNIBJ3iyHjuZ9aLbdPV2nfmIDB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDE4NyBTYWx0ZWRfX5QtBlGY8nON1
 AuwXY65wS/dAuRkc5+qDr4qWH2PyIIX8Ux6gZ39WTTAMYEsLSEUOWt+5RlfFmp9ABEpQW/xDpqA
 yfVRQQwFLBFe6dY1krTtYiZtW7ROAUck21B6dQGhHrO3ZlpLxs+5WyVzPYVnvudUZHEOBvYjppB
 J99HCahV3aScxPFbEzpSAYumMFlw09O2joofip1S8xjYC2uSbAa3o92AmdpPcKw9+CpgLbrPbXq
 pRC3Myj1jTRkWrVPE6+rgKDDiSxSuuSB+Z/0q+nRpqTsI4iLrZC0a+XPJ6o5kLSVF5FvAA7JEwq
 iep1JBgGCBpdau77Js/RomLZz1x3jIpI9d6MrrxbOtueylsRcZqYGJ2eqasOuwKHO/3Tw/H/X4e
 YOfgASET5FgAOle1posUtX9YTuwokwwv0bNGcOlVSD9vHbBUMmt/WjFSmPj89Eg9KsNFPBCv
X-Proofpoint-GUID: qp-Lo-RNIBJ3iyHjuZ9aLbdPV2nfmIDB

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
though fwiw the commit message doesn't say if what it's mentioning is a 
bad thing being fixed or a good thing being provided.

On 8/13/25 11:57, Kris Van Hees via DTrace-devel wrote:
> Test with content that could be interpreted as a string if the consumer
> handles things wrong.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/actions/trace/tst.array.d | 10 +++++-----
>   test/unittest/actions/trace/tst.array.r |  2 +-
>   2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/test/unittest/actions/trace/tst.array.d b/test/unittest/actions/trace/tst.array.d
> index 9e0c410f9..e74c155cf 100644
> --- a/test/unittest/actions/trace/tst.array.d
> +++ b/test/unittest/actions/trace/tst.array.d
> @@ -6,7 +6,7 @@
>    */
>   
>   /*
> - * ASSERTION: The trace() action prints an array correctly.
> + * ASSERTION: The trace() action prints a non-char array correctly as raw bytes.
>    *
>    * SECTION: Actions and Subroutines/trace()
>    */
> @@ -15,10 +15,10 @@ short n[5];
>   
>   BEGIN
>   {
> -	n[0] = 0x1234;
> -	n[1] = 0x5678;
> -	n[2] = 0x0000;
> -	n[3] = 0x8765;
> +	n[0] = 0x7464;
> +	n[1] = 0x6172;
> +	n[2] = 0x6563;
> +	n[3] = 0x1234;
>   	n[4] = 0x4321;
>   	trace(n);
>   	exit(0);
> diff --git a/test/unittest/actions/trace/tst.array.r b/test/unittest/actions/trace/tst.array.r
> index 52ff28ecd..90c6a2236 100644
> --- a/test/unittest/actions/trace/tst.array.r
> +++ b/test/unittest/actions/trace/tst.array.r
> @@ -1,7 +1,7 @@
>                      FUNCTION:NAME
>                             :BEGIN
>                0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
> -         0: 34 12 78 56 00 00 65 87 21 43                    4.xV..e.!C
> +         0: 64 74 72 61 63 65 34 12 21 43                    dtrace4.!C
>   
>   
>   -- @@stderr --
