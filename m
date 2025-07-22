Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F992E174B
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 14:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753195970; cv=fail; b=LLq+8rUU/r8VGql4bPBKKeKMILV8iaByIbJ5bs5Mkh10Mt9D47ZliFFbckgCO5di6wVpIdUU07dqTkXqzSGhcCECY/w1htfJCeM+YElFdckjuYkomj1cXdZD16UuoWo9SRVZcE4P+hafkTK6rQ02oxhjjanTblHailwKLtQk92g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753195970; c=relaxed/simple;
	bh=2qDZuG7YHOwP+QZaNNo6pvH7gLHnDcRGOzZTTqX8lsQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ymk+SkydtHuPbZUQUQAjDHMEoCh5zaJbKGQDoYvW2dHvw9o1naQsvAj9GZkhYutKqQTMrSKtIHyX6yUHfdGaSMhYiDPhS1sosaIfvB7fd0qC97iZhivCCC2EZS41vY6C/imlJmSqJt5e8kRTHqSK1lA5SOsWeQjIXjNbicKPTGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NpmWRmCM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XnlidYK9; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NpmWRmCM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XnlidYK9"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEN1vB020727
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 14:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=2qDZuG7YHOwP+QZaNNo6pvH7gLHnDcRGOzZTTqX8lsQ=; b=
	NpmWRmCMDva2pjPGFXvOfMrNRY+tMCDc59N9KvW6dWNQXHMZEetP2PDl8fDpBAIP
	6AoZUdOU29HoXbUHKmYpAz8GEmVjdlhVBRSefDoVKZ3jELsBXD8Tctehd0DWEuRl
	LMELALGH1YHlIH9Mdv31APuBVVvSt4452qEf0cCHg4jk3by4+NYVJTzhZfBLc1SN
	uA2jGEPVo17OVHkpzUiJsIMvStsolMxSvOXkJbBqiSeQg5J//jS0MgdKdp7BQPHJ
	UmLuf4YZoAbNmFbAi7LiyNN573ENhdt83oPFU5+wts1C4MkEgSIf2JXg17ig8mVp
	1bOQEpH8UpaKcKYXJM8bQg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48056edg57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 14:52:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56MDnAld005769
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 14:52:46 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t9e54r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 14:52:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzP2xu0BbSx/RZp4nbbSKROYmq2jgguglDPceDNHO3y6cdkTmaZ8Ksx3jNQPmHrFWuuX0ikiRFVqaMgO49FHsNhjb4ZUtSOBdgS5jIALThpMonyI4jYa4zue45vqpIwQwGvO2YbjvNrJnCkRPy2fxZfUzY1CsVUVPQ8Plz3H3UgurthNW6f0tyW/VYH0ONy8qe2KmQLQg9d80Ru6FDpBkd8xRJ1wXj3Yx3UV9wX6vYMqSeZ7thdnxk6FZWZCfiGg6MkQd0hABCw9g+jdC3wGdVvxoV5aVdxZ5OokqxtC9l4eDmWxGLmScGNZX/i1I4lsyEVv0cnLrdBm+nWkRSQjTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qDZuG7YHOwP+QZaNNo6pvH7gLHnDcRGOzZTTqX8lsQ=;
 b=fHtV+VrSQYrKQ3oWCGFg4weJaFLJtaWG6d2pcXQ7vVz9r9BZrCZRRDHb+1GGEPIB246Ro5/RSEyg+mNr4AamTBf7XwNH4fX81y/IJir7fOemsvVa+N7sJEtmythdpjOItpe9sesdtYiKyWpdvBmHarmKp82ShMIt9BMYJQEERV+CHbUjh0E5yfEJzKlFoYACf4yKMgCnqNjZp42oks2yRHWDHRyZn8AH7zvotQ23NvVZBlCXHLNzErGrQLBl/mU1S4DwSTY5T2oWxqyqDX922OWfWKbCyc2cCneW/Qc7iwr28/4bnC5YU7ZUaMvlJTij7YF0DcYjD9PlpSKMOw3gLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qDZuG7YHOwP+QZaNNo6pvH7gLHnDcRGOzZTTqX8lsQ=;
 b=XnlidYK9A+l8dX+25GOd8PTNgs2h89pBUmxS7lHDUVuYoFpEVu20ApQkyFOMK73vtYuIAAntlrjUrjHFj1X03re2hijdqBXcE9BO/tSo6Km99DdO2tspmdv6Vulq+zd065V0MhPuwhB0U6/tpgMh1djw7986Hf8y+LiQhFHc5bw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BL3PR10MB6089.namprd10.prod.outlook.com (2603:10b6:208:3b5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Tue, 22 Jul
 2025 14:52:43 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8964.019; Tue, 22 Jul 2025
 14:52:43 +0000
Message-ID: <16bca04a-7514-33f7-2496-b870e3947b5a@oracle.com>
Date: Tue, 22 Jul 2025 10:52:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Make sure all probes are listed in default case
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250628011932.23469-1-eugene.loh@oracle.com>
 <87o6tc71f4.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87o6tc71f4.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:74::30) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BL3PR10MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b775d2-83c0-41ff-cd64-08ddc92f69b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzI3cEhLeGVMdVdDS0xXTThYbzNraGN5djhuVUcvVGZPd2tMNURZKzJmYUo0?=
 =?utf-8?B?Rm9wdWpmR3FFc1Rhayt6ZHhCSFNYZUg2S05TZEYvMHBrMmM4NVhSZGx0QWZy?=
 =?utf-8?B?azFNZ2dqT0hrbzhqUUY2Mk5XdnJlazcwc1pjMHRBUFpaWitrWnJyN3RLRnlp?=
 =?utf-8?B?Z1ZaRGFiNlhqN0IybHBlUnZIY0RYWFZjNS9JVkJkTzFKUUpKUko2eGZmOXZn?=
 =?utf-8?B?UG9yL2c5SklXeW50M0QxcjlwVTBuR2t6Wk80aFZ4cEE0SitPYVFFVXdTUTRr?=
 =?utf-8?B?MmtxcEgwTlk1a1dOSUZiTXNPbUttWmE0WGRoUEdtSkF5RWZlTmNTNkdQY2dU?=
 =?utf-8?B?bmhTaWJ2ZzVYRnpvMGpJNlB5MUgxUUZsRXk2R2h0aVJrQXVXdERtamdyc1pM?=
 =?utf-8?B?RFNVei9GZ3Y0NndDeitJdmdIcXZyZUtTWmhWb0FzYk02UzFSZDRTN2VBWkVT?=
 =?utf-8?B?N3dBVVJjMmZVY2kwZVRYdDBGaUZLcDROZUdvUWhYU1hCOHYwREl5a2dOZFIy?=
 =?utf-8?B?R0pkcjVyeVRJWmQ4K2xFRlV5WFFkRkhOMndZemF6dW16TjRMSHNTdXZRODJ6?=
 =?utf-8?B?L2QwN25wajVES0Yxc0Ruam5MWmwxVmRlU2FNOVlyQ0ZRZzNZWDBDVGxadTNk?=
 =?utf-8?B?cGNMS04wVmdCR2FJK1UydFFndi90MmFwcXB6QkNGSHNSaW5zenBRSEVUb054?=
 =?utf-8?B?dlNqOXNKcHlWYXJFQXNiT3o5a1dVbTFlMnJLU3didmUwRlJrc1ZRKzV0WSs0?=
 =?utf-8?B?NVlFUk9QTWZXYVhHc2tOZ3hXSjNnVDhuUXpKbGRWM0ptZFBPRHpaVEtaUDFT?=
 =?utf-8?B?aFdMZVdsUUNoeGVzWUY3b2MyNmxkQlN5akI2Y3R1eWo4N01USXVKQVhVNU9T?=
 =?utf-8?B?akk1d0tlZm9FT1RvN3B0OUNvL3FNdDhqTll5MGtqTjgvYVU1ck4vQWFyNnFI?=
 =?utf-8?B?VEkwc0FDLzRaZDgrWnV2R0lUZWZPZUgwSTF5SjBhRmZnSmhxSTA1SlpiTUJ4?=
 =?utf-8?B?V0lhLzFydnpIRHRXUzdtbTNrT3poV2krVmFTenhBVDNtRzRWbkNXbFFid0VZ?=
 =?utf-8?B?dnNTUlBPZDNFZkxtYjFuWFpSREJocXlzSW5laVFlQXFhcGl5STZsdU9OL1lS?=
 =?utf-8?B?dW9pYkw0K29MWFlpWHlyNUlYNzZsQ2JXVWhiazZuRjB3bTBJWHRmTVFyNDRs?=
 =?utf-8?B?bUc0bkF3UlhwdkhFeEEyRWNKS0tOUm9YWUUrMUViZi80bG02Y3ZkVEZSWVhY?=
 =?utf-8?B?b1FOTEwwL1ljTXBqYkNvTnpjMk1hcmtsN2hhQ0J0S2VxY1FoWjVPZ2JMQW9W?=
 =?utf-8?B?MFZ4TVdPZHRqZ0dCdXBETkhEaVRoM3lHSVhmeUpmd0tDSjZtZkxsaXVCK1hC?=
 =?utf-8?B?TTlXNnkwTHFGaGptbVBTK3lxaVl3WVZZRVYvTWJ4SzRhK2UwdnZoM1k1Sk9O?=
 =?utf-8?B?ZUExbzFtSjJBL21YZlJaTkpCTzd2bmkxVEZ2RTdxWVV1QnlOWjJ4ZGpNTFVs?=
 =?utf-8?B?NW5pNUdSS2tBa29Gb0NMZ2xGT29YYzduem1nL0tqYlhsR0F1VFZsdU16djhR?=
 =?utf-8?B?YkNZenZYWnVFV3JPWUFCZlZYbXVZTzJuYTVUUEROTXIxVWxvZlFZYW9CN1hP?=
 =?utf-8?B?b2xrQkNiaHh6K3BFNHhqNFFhQ09JclRvS0tYRWdQdklHaE8wN2NLM1JCZVJB?=
 =?utf-8?B?c2xVR2VRVHhkM0NGUWc1aEJQMWhKWlRoajY2N2dwaVBvRWdGMXlYbjRHWEow?=
 =?utf-8?B?YmdFNTIzbXFySHNIaWh2VGh1Y1IxYXYrTVh0UkJ4aXdLS0pSYnNFM01NVzFY?=
 =?utf-8?B?eW1Yc2g3azMzOUFoVEpZVTNBdktFbFIzNW5GeXBxdGZ2V1V5bG9pWXR3bzJv?=
 =?utf-8?B?SlJnZWRQVmZ2d0V4K2tNN1cwcndheVVkcDVPUDBXZEVGTlZrUEpNakJyS2FP?=
 =?utf-8?Q?Jtn5MnpTFD8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alV5dXVSYUZCS1lHd1E5VnFqVE9EM3dmR21rbHVvSnBaeVFQLytrdmIwd1JG?=
 =?utf-8?B?a0lhVU16alBVWjdTS0J5V0dGM0xLek9DTHcrcEdJb2c0RWZxaWROcVd5ZEhQ?=
 =?utf-8?B?UFhxNFFLbDQ4SUxmZWFqcDBzL2kwKzhJcUN6Y2sydVB2RmtBNExNVlp1WXdw?=
 =?utf-8?B?am1wTlRkRXJkZHF6c2FXenl2VGlyYzFzMUtUZDl3K0Zzb3VHUU5ZbmJTSTFP?=
 =?utf-8?B?Q1dUS0V3NkZDSVljREhUd2MxRnlyNmVpaEpWWFU4TVlIYnFuWk9JYjE5ajBB?=
 =?utf-8?B?MTdIVTJTN3plYzhadTZYNmRtL0cxNnl2U29xZm54eEZPVll0ZnM2THVaWTla?=
 =?utf-8?B?TjIwQ2RuUm0raWJKaGpwWjE2UmtGczBRYVFZOVg5a1NOMWZMUExjbXVzWitB?=
 =?utf-8?B?MjhYYkZGaTZDTnFSb3Z2aE1tUXZKeTVUUVlGbGRhQVViYlNubTZwMWVSbjFR?=
 =?utf-8?B?UGhrTlIxT3VZT1NBR2VUMk9hSWhlSWFXcmV1VGdSa1AycHJReEhnL09nbng5?=
 =?utf-8?B?amI0dEs1K2hlWFpYaG4zZnNuaWxSMjZncGMxQUs2UTRHZzNSc1E4ZHNZL3l3?=
 =?utf-8?B?YWZKSDFiTmxpOXdrQS81aGo3WDQvV3QyeFBqSnNXck16QmQxSVVNR01IejdQ?=
 =?utf-8?B?d0FrOTNzNEt5L1k3ajYremdoa0EvUzNMRFJnbEU3d1ZqdEk4aE80dWIxbTY1?=
 =?utf-8?B?cXNmSHFMNjJQa1U1RitCSVR1b25qNE1Kd3dHbStGRms1OUdIYndNcVQ1d2gv?=
 =?utf-8?B?ZUttdlptWkJROWFnUjMrcFZEcUJQSEZGazVEUmV4UnZEZGFBZ21qWFJRa05N?=
 =?utf-8?B?N0hWeUJsdlJUeUNYVEFIVlA2Znlnc2JOSHZwZEc4S0kreHc0aDhlQWVBSE11?=
 =?utf-8?B?TlJsRlNTTGUxY2tkTnVNZmJ6OXU0OHBwYzYvNVBPeitQeDNhcUZKUStHb014?=
 =?utf-8?B?L0UrVjJWZ3NTWnIySWhibUQ4SjgxaVd4QWk0VGU4SmdXUjNRd1hCTTdwTUts?=
 =?utf-8?B?Y3l5VlRWaGNSQUZ6T2p5T1h1RmtRdnZzZUdoSUtORTAxcHBiWDRWekgzeFov?=
 =?utf-8?B?Ylk2L3JrSnA2M3BBV3Irdm9yYlJIcXZ6aXByemVhTUhMM2prZkJFblZTYnJC?=
 =?utf-8?B?SzNiczgyR2g4VzFKNTlrMWR0V0hpZ0pWaWhWNmtuakh0bWJjekVkZHY5QTA4?=
 =?utf-8?B?R1lJUWswcW1Id202T24zcVFKQ21RaGNSaExIREJLVk84YTRCVlc1aHdqbFlO?=
 =?utf-8?B?Z1lSZEZYNUVsa3JBUzhPMXZwaDJNTmRuYjI1UmdqNjRrZVpkZllPTnZaUlNu?=
 =?utf-8?B?dktnQk40RWhKRXFvS09HajZhamV0NmdPYmJ5dU5jU3B1dW1KSEw1YitaZnRW?=
 =?utf-8?B?MEZIYkhRb1ozNHJnSm4vQ0V0N0JkM3M0UzJMeHpGaHY5clU1THBkbTl2OXhv?=
 =?utf-8?B?d0FYVFJNbDVaTFIvdzAybzhhQ25aeThLWEZzWStxN1htVVdaT2JhWVZGYXNV?=
 =?utf-8?B?OCtCcm5EbXpzdWxtNS9XK1M1NjFuWFA1R011VVBnOHZEa0VMbUJhb3Vpd0RD?=
 =?utf-8?B?ZXpuMS9jektoWGM1YlAxUVByUHQ4NkI3K1cvaHpYZjMzYjFINnJLdk1odVFG?=
 =?utf-8?B?VGRCK0dQbkR1bFNUL1VqbDZNZWZVTWNUOFdwTlZaTm9JSmdSb0JCemkvcVNZ?=
 =?utf-8?B?QzNKc2FXV1M4ZkVjNFhEWjdTSXcxM0JnblBNaWJvUmhsdnowSExXbTdTVi9r?=
 =?utf-8?B?RWhRa2xEREtuTkU1b1ZFaHdLWmR0NjMrYWVZdnA3QXEvRDVzOHBueDZsdzNE?=
 =?utf-8?B?RUhwb25nbXhzdnNwb29aNXVsQ09iNWwyQ2gwWEZkbUtFdXIrcmpRQlJ1RG1V?=
 =?utf-8?B?RGFhd1ZEZmtNMEpXNkthZDg4dVplRjJIYVNtYTFTZUhNL0ZPZ2lzVHhvaVRL?=
 =?utf-8?B?Uzc1S2FQcjRXSGMxb0wrU0FJSnk2U0tzT2FkK1EyeDc4ejlZQXg0U3pEMlVP?=
 =?utf-8?B?UlFiZWZnOVpvN2VDWUo0Tlo3a2hGV3dCbndCdUtxT1IrT3lUdk9EeUdQZC9J?=
 =?utf-8?B?ZUV0OHlTTVJHR0xobHY2VGpvcFViMUN1bERqb2NlVmpGWXh0U01NMUlDTDN6?=
 =?utf-8?Q?EEuUXtLbMfM7stYuRP6uY5cQm?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HGLWD7qV8oavFyRzGF2CWe/eMGJ0jBFkdouImLttYSVjQ7bBBxsfQtu5LsJtIEBgvZlJlyne8mv1K72kCvHsLa5f7pOtHgQa+z6nLXiHs9Eeeyue1X4iAoVyR1zHUT7jgBg+huQSWkmk+Aap1cx6xySXLwgh75f2GoXLYN/tN4YrxSfVgSxRj3QRGdlu+2XTR56MnLWdsQirM4JGend68YeHLbsz902ZYAyNsvl1YsphyIRPL7TIyCB2y+44ZZqvhpRH5zAapVNrCvAAqSKspC9bnCFtrsD8fQNh835uv39rVWzWPs1/PeLzWHfFzF0snFcdTtJlpsMn/a/kyJGh7AReKPHiNy81OiOsRTILG7TPejaU8eLIiT46gpiTVscr1r7HuqZRabjbWHxqHiGtbIGiWxSfexIHWXo8t7rLfIN2RO4Eg9spTy3WTyjSxz5+eWxCo67ZQBJzaw29DMoDL+CrWp4Jz2OnzrpP+n1Fdb9iUQW+zt/b612fYw2RFbc+BOHZxUcc0GJ8HvVQ5B3gbz5NhwZ3fDcGo6Tp24jkt+FY809jKDzhFqkIhBtkxTB2WIEYwTLnzGv0/3Xy46zJsXP1wFfbOUB9wmmhpK34pac=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b775d2-83c0-41ff-cd64-08ddc92f69b1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 14:52:43.2461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzB1bY3p6rfsxEo5C32sBj5uyh+4RCPsVlBinehKUdWX4FEItmPUraEme+kwStCehDH8kpbkD7OW9h0ut9lqmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6089
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507220123
X-Proofpoint-ORIG-GUID: qug3P7t0YdOuS_ONlm64Jjg82S1q5qgL
X-Proofpoint-GUID: qug3P7t0YdOuS_ONlm64Jjg82S1q5qgL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMyBTYWx0ZWRfXyex6FTfAMtoh
 crP6cI7F38R79FbcgvvjTVodOwSV0oJKzUrNAgm5KrpNNjUHgDWWuZEKmZ3o6DwSsBF31Dov3MR
 YPNC0mxJJdd3gQIRLjaIID+t5TXm8nq58camLfSfWOii2bZ/Hf7ggg3mCjG9+2RfRQ1hpaiiD2c
 t2CtgLTmFf+0HVyqaT+6T2Q61qacPJU2foWMggYiygZsoP3RgHa/aPiprGZrNuPH7RvEPA9zEjo
 9f8fkRzXjiE5OWRT7to6ZogZLT2evLIf6C33p26eFehQZRNEONbpQ3UPx4WOlp+Q6BXN4N12MCp
 KNia5E4eLDBXkpEUlIQZ1h0vl0I3VptuwyfOCFePs0a0UJFBB+yyh39CDg2X61s7Zo84Z1mhbTy
 sXVqNFUWYIJpK//XN/po/tivptlCJeDk7UbIthlh6BXkq26nSy9xQ/kcpIm0w0Covt6ERoTR
X-Authority-Analysis: v=2.4 cv=Ef3IQOmC c=1 sm=1 tr=0 ts=687fa5bf cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=3tFgFkuynIrtPHluj2MA:9 a=QEXdDO2ut3YA:10

On 7/22/25 10:19, Nick Alcock wrote:

> On 28 Jun 2025, eugene loh spake thusly:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
>
> (presumably this is fixing the problem that lazily-instantiated probes
> like fbt now is weren't instantiating probes before trying to list
> them.)
Yes.
