Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6444207A
	for <dtrace@lists.linux.dev>; Mon,  6 Jan 2025 23:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736207090; cv=fail; b=rr1Id88XJrGCBNSWdLQ8WuwucGkzw3+O3YRwwO6HuXDVT3PH0LnIMnWQsZJuDUYPZHOGWrt+6svJNnuJrDO6I2YaoXx1c3nUKTd3kYbjaFqLuCIrRt6ed4xWX3Bj5BReMkO6Lm9YHdWh276RMcXI0IlN5qFw367YBDkRdGtKqWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736207090; c=relaxed/simple;
	bh=4viHIEGEbmTEkqpJHfIywt7AwLvXYU/cAkjQOW3XSaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PokdWOoodZLNeVksHIidUDk85PaQ4eS8O0x8++k8EC3aESDeGKYuo7ACNvBOPhTfHmXHqFrMeWlqfashrqTLmEsxoCR1o3SHImhEY5xTQAdaowOQuWj0u1cVSatTIWlRpKrutGtCCOJlhRvhgnjUx3fsTb1sRrH2yFgMjVrd/yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YxIFi+r6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Qe5MI+fi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YxIFi+r6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Qe5MI+fi"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506LfnOo025510
	for <dtrace@lists.linux.dev>; Mon, 6 Jan 2025 23:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=mR6mNC5g+BTX8+CeMa
	bSXqLz5WbMFeAQHFIY2rzSzrM=; b=YxIFi+r6UlSmZ2l5Gvu+/0izFue3hwPV+V
	M6ao6gzywzFv+9LGn93LgSPFHZdlv9ts4eBomFcujuc5i4GkMQ3ttSQB1RodehrP
	3+7UtFh+hTJTjOtkcbmOw0b62n1PvIdJG1wiqIzZHcKI0m31UdrUFi/iKSeESmc4
	RVRlDaVahj+iCm2860snj4muYiYdH4fLuCqk3HG/fTVFjTSpcWPQDUxi3UDG1CMl
	hdAcQp+DDXVk6fF23uXih+uZAcE6urO+vwHAmK6dM/lRujnANrm8XHN+JnB7qYS6
	xECoj3gVLI01fVQ8jmir8KOR/TFtOs4vm+2ZwZY6gQA+eDmGPDvQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xuk03vku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Jan 2025 23:44:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 506LFddT020044
	for <dtrace@lists.linux.dev>; Mon, 6 Jan 2025 23:44:46 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xuee5ds3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Jan 2025 23:44:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYZcoTag+MjgajcshqDM6K6p9SQeKGcQn5K9kp+MqmCJKqv8ppeKodC4FXFjyFkPOru+M08G4JEzG97AUJ2suOfuLHc9OnuXL6ycbYGqqtb7NRJ4hjruXLExqnZk7cwqPM7wari1DDafJbsgC3UzsA3aV/150Bv9ZmDZinssxEecFybXrvCREltBL/9B33hJ9v6mk7eFyI5xXHGdlVI48P6xqXqSx938H2ohSaeogtJ2lBw0K6FpgF7V+qDKhFef6vbRO45d1wSCj3pE/YtQJyc89TNu3nJoKV2uTpBEKvFRp8R+v12pm4VqFKFeYq/hJjNUU6oCa2Q0j3BgZB68fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mR6mNC5g+BTX8+CeMabSXqLz5WbMFeAQHFIY2rzSzrM=;
 b=vLLb9RQXiak58vLcv1am8oZS3GuSqmtWszreyCFk516PlvRY/BtqHSwwMsajiQvIQ1guLij9uo5hsyptdQw+HPZNU76DEXrijO2lqzWvtYWti9TMhK8+JLR53PSUZMEoQkrbp9wdHHG1PL0Ru0UOkWs9u6eHHimppXXRpTcc5yfuJdUINziVnutindA/QJexvRaxjvYzxUv3WSEN424BObf2TWLt6vSInAPTbHjSCjm2hmchsDYDSK2xEUP6K2lV2YfUoejWXCno0GduU+4ASiLF9BjeEdfThHUG5gmuBvctrJvIVmkTNUZHtEPIuOWJQfFrdDYzi2LHBujsNqHp8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mR6mNC5g+BTX8+CeMabSXqLz5WbMFeAQHFIY2rzSzrM=;
 b=Qe5MI+ficp1iiIKLQiha/hEUU8TZ2VZwpqnQm+x9VRVErtlctFfNYePItzU2I6SqqrnNpCtxwKJWro+l6046OsIr3hKw/W5lVNMwlglxt/igZzIZwU6LEfqFVs8NI9+uOtpDhpHzPKRDZGWZPr677edqLQOd3v5JV9fQUT0HU8o=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by PH0PR10MB4534.namprd10.prod.outlook.com (2603:10b6:510:30::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Mon, 6 Jan
 2025 23:44:40 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 23:44:40 +0000
Date: Mon, 6 Jan 2025 18:44:37 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Allow duplicate usym/umod/uaddr if for different
 pids
Message-ID: <Z3xq5aJR/HQjQn5d@oracle.com>
References: <20241205191318.18587-1-eugene.loh@oracle.com>
 <Z3xFWS+WEviQKMtl@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3xFWS+WEviQKMtl@oracle.com>
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|PH0PR10MB4534:EE_
X-MS-Office365-Filtering-Correlation-Id: 75170f75-f9b0-4a1d-daf6-08dd2eac1652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Acri1rv+jYTavEVItIYaMZGgi6fJyxg62SNmwAxT5m2nrpLYpAZssYtv3Ohc?=
 =?us-ascii?Q?QyOTi/bm75CwWyHUTMBfys436AlN7eFvBZ66jxRHi7Rpwiws2Fke8nfVK7yU?=
 =?us-ascii?Q?AJM3WXqhT2MnRiYMIEJyyER3F35+WgmjL2IzmGEiv12141hHeRVHix5UkvMc?=
 =?us-ascii?Q?uIrkXdsN9PTK65fFFIMzShtWFnAVm1KEyz4gmOz3e3aS538SPgah0/V4Y/xF?=
 =?us-ascii?Q?MIs0a0tiMBU4hV+a7I1egpVM0qLiUX7wK3g/FWqJdm3vGwR8Eu+x6de5q15u?=
 =?us-ascii?Q?qwh+raBLsZggrqpcPErMJFPQfeLqz+zLTYnFHKxrUbZFbsiSttWKOQiFyTL5?=
 =?us-ascii?Q?TtijLbNdgeR9gsoMkXWdSPiZiQzLALT7qnubMubSEDvy+gJjg+yA4iST4CN9?=
 =?us-ascii?Q?erwBrGgy/oP5ltFKnbiyNB5uLoKNqJDMbSt5W73nx2ZA3GmtAK3CK+KuhyY6?=
 =?us-ascii?Q?wJXBi7UrE8Nhcva4FFmo7ZMweRxVzu6iQZBAtpmGsEqMP//b7OMk4hpB5LNO?=
 =?us-ascii?Q?MKiY0W9gdInT0ZzxejvPjng10yA5GUURPxTqlxVAy7+gqYhaYekUnTHCLgbs?=
 =?us-ascii?Q?Ex05zJQP0T5GF0rJb19JH6oBBqIOSjEBooyAzCeD5F0JBwF2nrvELuUJl3yM?=
 =?us-ascii?Q?dJStXSN3E8slIusk3AwFbBu+5ejZwxSsdrQl2C4hYoeCUIgwV/yshobKpRW1?=
 =?us-ascii?Q?L7Romqh5DjXxCqu4yb6sNpGH4m7m+k4c6lyppTYMi/kYgQuHlkbc5lCxJI/Z?=
 =?us-ascii?Q?0nF+ZKLWnhYpmy1GY4pPbPmyhuaz9e9v5cPs5ak6tMWADj3IOYIsutmXiJ8F?=
 =?us-ascii?Q?yKhTAFRMwpw82WCS2mJ/qLawKikLiFn5eKvc8uf8mqVYUrnSnIk/BytJU+FQ?=
 =?us-ascii?Q?yOoCYfmr0f4M8ftqcNy/fLLqEVjS0N1H9JuLFrNwoVnKYrsdNhV7W+5o3e8w?=
 =?us-ascii?Q?FBU597FFpfIjAqA5NyKCnu9p2yXaRUfThmDSLZcmCDVcHMgDPI/jdRMJQbGL?=
 =?us-ascii?Q?nUoTa6KBYQsetJWv2jjR8m/7OpkkGnJN126shfx0R7nqdQx/lnHjf/oMRLtV?=
 =?us-ascii?Q?rvNGlpjynGu3J/PzJcX62ycJndu+HzZvZBMo+thZZs3q92pMqqmSaA51xDbL?=
 =?us-ascii?Q?eQnNz3b8maA1udd8NTgTXXWFopVs56uSORLzOIk8uYGW3XwDEGIrbd0G5+PW?=
 =?us-ascii?Q?uL6lGro78/gsl95MY3t4HZZ4C0XaiY/nG5rOIuvI/N4pFNhR08gCgpqIrJV2?=
 =?us-ascii?Q?LyCnS/ljy8YwKwSD0bz2nfqcNHNgKi0CAAlrCMrS+l/yQ2IlxyEH4Q7v1v1y?=
 =?us-ascii?Q?dYvYqkYzC4E6Bcy4iODNegKUtQI45DBsLY9ZIOIj+uF2EJ1k7fg/J/mUppt7?=
 =?us-ascii?Q?4x43Elmk6fZhcsjAf8zJjTBCh3zg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nsuJZtcZPCMzbwHJ7YhZImEqLIaOAyVwRomwRmAnWZPG7haf58pcPHIMqsFS?=
 =?us-ascii?Q?R67VQpe2M1zCYc3a78ZbI2naABxfhynrU21wQyMRQFDw3tz5zM5QFZIBbevs?=
 =?us-ascii?Q?lapIgo4kdek9vjH+c08xalJCNSqQo5BAahtgz9wq7HbpEEv01kvoEN63kMHT?=
 =?us-ascii?Q?5CtSf/7GhPYHZdNvWRHKjAJSdOCuAz7VOZuUd/s+CzD5lqCjbL5eRBEbSOl+?=
 =?us-ascii?Q?SszqekUGwIq/1ln4dCs1lqy9cm3BJ4y9FSNvm+zlc4Inh9UxOleViR/FcVJ8?=
 =?us-ascii?Q?UTPPirKKL+AapRv4RiCBFaOkDi62nUhfJyirriH4FSxITirUrwrd2lQKiAse?=
 =?us-ascii?Q?gp1GvX662LSjHxJbcXJ4Z88FTsHmlFZjGbO0n/epPsI8onkXvCnEhzDT5e1B?=
 =?us-ascii?Q?cEHnGYsI9coy5xlIpq/iSzsnAUaW9HsizsT2IlM6q/uR5alys47lbGX0d+vq?=
 =?us-ascii?Q?1NYwpn9neX0HUBNJp03Vy9ReMc8M2DtNIfF0p5W5HAObGdNhBV/URqFoJmlj?=
 =?us-ascii?Q?xmgZ94nnB8kgxsJrc7F1bbQQ2wqh+/FX79MUZG6uxwX45cT+Pd/BEqwIKc1y?=
 =?us-ascii?Q?egZ4g1I/aqbKiYRVIF+w231t+uBh2igKkOyjthPA+Q+NzXNuL7QF2MtqU4gS?=
 =?us-ascii?Q?ONMjHcVsi5VlPDJAMuzJH4f8YwO2IieQCVqWMkYEH/EtGIqNtRVvIbyPTQ8c?=
 =?us-ascii?Q?EdIno9WOLj/yslhYHjpAyW0sbQkWAf0qsk/8hhHsIfyEhtoq5da/UlPWrOU/?=
 =?us-ascii?Q?eRA1/np9lLAIjLF7xyfX0rRzS3PAOCGVH2LmMiGGU6xIe7fQNEogmxiH7SAT?=
 =?us-ascii?Q?CFuQ3IfgLn25WebQRcY9/DHRkk7bYeelOV+iLCLbM9kmdRrYQKZrAO7WpM0t?=
 =?us-ascii?Q?BLQCQQ453UbELU6+cgd5tib8Eepns9eZhJt+PeQJbBWmZDGoxI7Ulb3IQ2Rm?=
 =?us-ascii?Q?icM7YrUVMqYBFKhCNtaX5fKmKdk0m4xDOB/gloeAqFYrzKcKXgi8lTQnvy5s?=
 =?us-ascii?Q?iPbUH3pwCkxnwzzm5t1MLs4FVW9k8pTfceyVvrNsGLifBAW3E9n/TGKGSG/O?=
 =?us-ascii?Q?eGk+kiS89Hxq9ZpgHMQcm0l4DevcwT/Q98E8pDMrNlByTDxBLDWZ/9zYAADR?=
 =?us-ascii?Q?3spBjzRb2+EmJ3MWR8sLUmPoiOUQdc6LpcohD6tGCjesyrvdknhVpyz3ReOQ?=
 =?us-ascii?Q?EwnwaySOfuzAcxFuoQlUTbmXZBVNrth3tPqErprc6WhVGFH4wqwrU/tj3all?=
 =?us-ascii?Q?s6R4F4IIjAOYDjRdmeYDs1HwftJ5+ZDYov88RmYmxiF5S1MhQtUsp0BlVOwF?=
 =?us-ascii?Q?qFU4MXjQJ7t0T9HbNRxAo5IL8QokL1aV36e437XpKiCg3JeZRAVZ+Kn9HvRu?=
 =?us-ascii?Q?1JfhoTrQNkmrYoQWUixqZWi12SAOpthT25okFMYyqOiq6mCsnKuuQt5iZshT?=
 =?us-ascii?Q?ZdmyPJEqjSuVdAoQqmjeYEMG7gArC4V6PZrHwM4pq2dLvhdado4ICKbpNgPL?=
 =?us-ascii?Q?cvCRjhLja5Bj894T8COv335P/8EwUQO5p5JXj1OCwdv/kMVTOQWhqU8ZnJm1?=
 =?us-ascii?Q?whr++wrMOxs30W5ow1Qy5MezvmtuAarajDjJaeFvX18aB68vXNJhzN6L108i?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W4NIESUZKkOGFa1odhwJ7xvn5P496jDmHBp4SVQWVoKp+5C+rrEFwFNItCNugUZ0A7PQN81T1QJ4n2p+4Jqdzj8dNMLKimef4tpyj2PslSpcC5INpOUuTyKYJ9DPLP0sj1DU6U+oCPmwi11MkRH7EZYPJNwE0oNaLnE1GxLrlKTsuRjJlmk626hskF6zt0fucpZQ1jp4ZEOIMd8ASplnYhw+IPLeKqa98mGOl66RKIOh3H3n5iEZHH0JyPcqnlJTG1Jo1qPCMMoUsGD3cRbXv8ZdriBqvm35fHq5wZRrA5Ft4pm3NPqxaiVLK09q3mN7CFOpz/CAbJxxxw1Hfp29SMaeX2nep7OfzRJTUWCUn699Jh15PFjnHjZ+KeETHoGNpZJlOOj98SVXVGNUga1Vk2NdFJbFLo1QE0YbCmeaG44OIZzUWsn3CyWp6AIt0Ce4OY8S81vhp5+yMhqd2XlWUCqLEILo0nbJca9TpG1ft+9pwAWG1kZ3nBoR4QcgJ5wYDk8vtKVQCD764CVFMuecF8U2CGl3BPBB3TrItM1phuTgspemrmP6lPijI61qrOMbhXU+TnJAk/VRDuzjCE6ZfwPKX5SGtPZXQY5N/FnQSqc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75170f75-f9b0-4a1d-daf6-08dd2eac1652
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 23:44:40.2072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPkK4kMxSLTEsVEtrgDhTyj69VqjqtmQBO5BGyn6N3yfedeR8GYVrsqs0IABufZNWhLRZpTJMFWN67+7Pd86XMHbMM1DETsGrqwHP2SOH5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4534
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501060206
X-Proofpoint-ORIG-GUID: NpEXtTt7B6izv5oRuEkVhk1yQWdm8z8K
X-Proofpoint-GUID: NpEXtTt7B6izv5oRuEkVhk1yQWdm8z8K

Withdrawing R-b for now after seeing these tests fail after this patch was
merged.  Needs further investigation.

On Mon, Jan 06, 2025 at 04:04:25PM -0500, Kris Van Hees wrote:
> On Thu, Dec 05, 2024 at 02:13:18PM -0500, eugene.loh@oracle.com wrote:
> > From: Eugene Loh <eugene.loh@oracle.com>
> > 
> > In 83da884cbdc5 ("Preface usym/umod/uaddr with pid"), a bug was fixed
> > in which addresses in the same module (or function) might be mapped to
> > multiple agg entries.  This fix helped the associated tests run much
> > more successfully.  Nonetheless, tests would sometimes still fail.
> > 
> > Another problem is that the tests themselves were overly narrow.  It
> > is fine for a module (or function) to appear multiple times in the
> > aggregation output... if those entries correspond to different pids.
> > 
> > Further, odd behaviors can result for some of the processes running on
> > a system.
> > 
> > Change the tests to add a "pid" agg key.  Filter on only a few, select
> > pids.  Distinguish agg entries by pid.
> > 
> > There are still occasional time outs observed with these tests,
> > presumably because the tick-2s probe is not firing (when profile-1234hz
> > is running).
> > 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> 
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> > ---
> >  test/unittest/profile-n/tst.ufunc.sh | 12 ++++++++----
> >  test/unittest/profile-n/tst.umod.sh  | 11 ++++++++---
> >  test/unittest/profile-n/tst.usym.sh  | 11 ++++++++---
> >  3 files changed, 24 insertions(+), 10 deletions(-)
> > 
> > diff --git a/test/unittest/profile-n/tst.ufunc.sh b/test/unittest/profile-n/tst.ufunc.sh
> > index 243822407..f5174a1e2 100755
> > --- a/test/unittest/profile-n/tst.ufunc.sh
> > +++ b/test/unittest/profile-n/tst.ufunc.sh
> > @@ -11,10 +11,14 @@ tmpfile=$tmpdir/tst.profile_ufunc.$$
> >  script()
> >  {
> >  	$dtrace $dt_flags -qs /dev/stdin <<EOF
> > +	BEGIN
> > +	{
> > +		printf("dtrace is %d\n", \$pid);
> > +	}
> >  	profile-1234hz
> >  	/arg1 != 0/
> >  	{
> > -		@[ufunc(arg1)] = count();
> > +		@[ufunc(arg1), pid] = count();
> >  	}
> >  
> >  	tick-2s
> > @@ -52,9 +56,9 @@ if ! grep -q 'bash`[a-zA-Z_]' $tmpfile; then
> >  	status=1
> >  fi
> >  
> > -# Check that functions are unique.  (Exclude shared libraries and unresolved addresses.)
> > -if gawk '!/^ *(ld-linux-|lib|([^`]*`)?0x)/ {print $1}' $tmpfile | \
> > -     sort | uniq -c | grep -qv " 1 "; then
> > +# Check that functions are unique for each pid that interests us.
> > +dtpid=`awk '/^dtrace is [0-9]*$/ { print $3 }' $tmpfile`
> > +if gawk '$2 == '$child' || $2 == '$dtpid' {print $1, $2}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
> >  	echo ERROR: duplicate ufunc
> >  	status=1
> >  fi
> > diff --git a/test/unittest/profile-n/tst.umod.sh b/test/unittest/profile-n/tst.umod.sh
> > index 45d2b1e9b..7cfe2a073 100755
> > --- a/test/unittest/profile-n/tst.umod.sh
> > +++ b/test/unittest/profile-n/tst.umod.sh
> > @@ -11,10 +11,14 @@ tmpfile=$tmpdir/tst.profile_umod.$$
> >  script()
> >  {
> >  	$dtrace $dt_flags -qs /dev/stdin <<EOF
> > +	BEGIN
> > +	{
> > +		printf("dtrace is %d\n", \$pid);
> > +	}
> >  	profile-1234hz
> >  	/arg1 != 0/
> >  	{
> > -		@[umod(arg1)] = count();
> > +		@[umod(arg1), pid] = count();
> >  	}
> >  
> >  	tick-2s
> > @@ -52,8 +56,9 @@ if ! grep -wq 'bash' $tmpfile; then
> >  	status=1
> >  fi
> >  
> > -# Check that modules are unique.  (Exclude shared libraries and unresolved addresses.)
> > -if gawk '!/^ *lib/ && !/^ *ld-.*\.so / && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
> > +# Check that modules are unique for each pid that interests us.
> > +dtpid=`awk '/^dtrace is [0-9]*$/ { print $3 }' $tmpfile`
> > +if gawk '$2 == '$child' || $2 == '$dtpid' {print $1, $2}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
> >  	echo ERROR: duplicate umod
> >  	status=1
> >  fi
> > diff --git a/test/unittest/profile-n/tst.usym.sh b/test/unittest/profile-n/tst.usym.sh
> > index 634e633b3..8e373b976 100755
> > --- a/test/unittest/profile-n/tst.usym.sh
> > +++ b/test/unittest/profile-n/tst.usym.sh
> > @@ -11,10 +11,14 @@ tmpfile=$tmpdir/tst.profile_usym.$$
> >  script()
> >  {
> >  	$dtrace $dt_flags -qs /dev/stdin <<EOF
> > +	BEGIN
> > +	{
> > +		printf("dtrace is %d\n", \$pid);
> > +	}
> >  	profile-1234hz
> >  	/arg1 != 0/
> >  	{
> > -		@[usym(arg1)] = count();
> > +		@[usym(arg1), pid] = count();
> >  	}
> >  
> >  	tick-2s
> > @@ -52,8 +56,9 @@ if ! grep -q 'bash`[a-zA-Z_]' $tmpfile; then
> >  	status=1
> >  fi
> >  
> > -# Check that symbols are unique.  (Exclude shared libraries and unresolved addresses.)
> > -if gawk '!/^ *lib/ && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
> > +# Check that symbols are unique for each pid that interests us.
> > +dtpid=`awk '/^dtrace is [0-9]*$/ { print $3 }' $tmpfile`
> > +if gawk '$2 == '$child' || $2 == '$dtpid' {print $1, $2}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
> >  	echo ERROR: duplicate usym
> >  	status=1
> >  fi
> > -- 
> > 2.43.5
> > 
