Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B9E13C832
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 19:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722539022; cv=fail; b=i7gahUgvzRhPhiMrBy38PcGucWHzZ/bgkCrU54Hy2ucR3GExec/MYn2RJ2PG0fcRHAKmFXgs+w6/Ch+WyEgLu3jeK3Pza6a+mke2iDzOK/4RugnyCp4JvLH/bIUtiz2jiPns2cBL++XjyGsSeq4Tjhmv89eAFo/QXELuf1npV3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722539022; c=relaxed/simple;
	bh=roPhWRydIYTzqSK4N9eolT/JD3jCHXuW0HBiEuq/Dhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c4FVZbh3S8U1Mdk6Obea44g1FPSIDmQFhatb6ryezv5L0r0rMp707uPD8/m0Wrom7M0YzVt3esOTmKAVltUxMLgQW0j4o/6Enol2J/V0cjr5F2N+KXGSYZT+KbWMh3cerfg5VvHPY6OTdM7W38MJek8Wcmeb0ITToJ8A3IPm+BE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cK7NJRa8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=APD+l/jf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cK7NJRa8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="APD+l/jf"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471H0bgG012473
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 19:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=tpR3Vwf3nNRN783
	FFoSjrqOzQmJG7bLuciqfts2JeLc=; b=cK7NJRa84QjAOtnXS4IN47PU/Ea3f2S
	MCymimfuffcrQFMrgUaTQK/TnDRf8+jTonqLcvHcuVljcCLVnBeokh3xDJeCsKaW
	Zaylsx2vOUtFNvbFv7kO0irCK2clfCi7CsXOeYbPhpyo25lszSIpxsDNoYXcsoVs
	Qyt5N0zhwVbXTC23EMhbfKE2FemXsByM4hjGu/GAoLMPfnv7L/vc5spzJCoOBNDt
	7syMaptzAEuD68YkTislIPx1JvO7EBs29cHdG5HTI9whZgvMn2R07l37bgeluWpp
	a4B8pQ15sfy3M//VAcQGYIgD5Unz1dcSRTAA7KPBtJ1a5A337IGB+Cw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqactfeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 19:03:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471Hr8iN030831
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 19:03:38 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40nehw8yp7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 19:03:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQ5af53cWaFqzm9947auwEVgeX3vQk32SqZts5Q0wGXpOpbZL2netT8kiHTBUNBJeSO+URgrM47QiIsZyecdY/+KAmswNsBuunWxXZhf0oOwd4O1pjgaIAfKE1Q44l5vFe3oj2Qu2H8f5yJ4NxkFntcpyQ/+AQBg6+9eW8kTV5Go4ezDQpP5q3oA0sNkHxjuF8IGO/CsBKY7MRqDOwirknfdRnD0IHZ1U8KbZVsOiPyy1aF8vPGze89Hz8EUsLaYoLV4TktEqIxdpIHwAe5RoNNNuxnVQmUFml5Qt5EjFOHm/KVFvLf2pvFxdqK8Vek6h17xqliN3VsZsGaVX1eA5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpR3Vwf3nNRN783FFoSjrqOzQmJG7bLuciqfts2JeLc=;
 b=yNs+pWPN+951Rv7O/PWyjDRKN0UK6iIpcVNUnUbWElUV1tJVqNwzTiJYtAObcaJzBqrsf7iEJz+I1x1t3LZyigyWvDtkWGkqHL+8hDr2Wg3QcAlT4EW5vnvjQdlUpQmEFxi4N/OxWVg4duZAUjORiKO2pQcnZcHW8u0IP2IbB0xq2dn9Rg8zyoaA42RvNnrL7iaAR8bJEy4mjF5yi2cPkhGS31Y2c238c7taBOq2DRdwnZ+HpkeTQV9f8XdpqTMD+Yv639eysMuM8wRg/t55ouB/TgA87C8ChAOlqTdVWTYZUXOg1WRQ81FAZAXpmgNsUguTjNGg5VSmNCFsLYBWUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpR3Vwf3nNRN783FFoSjrqOzQmJG7bLuciqfts2JeLc=;
 b=APD+l/jf83+tJhEDe2A6SyBT7aNJerVACziOLQ1XWJStXEtxP20eUmT4PZc0IdLhEpV4TdexkSAoRYoAQuaSl/7EjM/yF0MBJ3FYwIU6RmDQhtUAMcPz541lYMaSONIIuNPLn0mjQOthysQ34hZ1/FkRWplaVQPVWO9UIcJMhN4=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB7035.namprd10.prod.outlook.com (2603:10b6:510:275::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 1 Aug
 2024 19:03:30 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 19:03:30 +0000
Date: Thu, 1 Aug 2024 15:03:25 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: ensure casting does not affect value
Message-ID: <Zqvb/Z8VKR6irF8J@oracle.com>
References: <SN7PR10MB6287E87D4C69887B1DC570C7C2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
 <87o76cjd64.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o76cjd64.fsf@esperi.org.uk>
X-ClientProxiedBy: SJ0PR13CA0070.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::15) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: 80fcd389-ab0d-4d9b-a6a0-08dcb25ca1bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BaCM0ofBae6k3Xb8HRMs9wPMbCjE9S8d8FsmkrhmGaxFkRD4n30sgAqTmWe6?=
 =?us-ascii?Q?8w/ycHIzzkgMBI4IhzB69FwP/M9cHKZ//4Ygd3KQQuKeN5l28owiRJJ5rGuS?=
 =?us-ascii?Q?MTKqtFH2MMCZlJYqlIQ7XawI3UIZ8XsQluBkxoJQG6gdPbAy77QdQ4P7ConK?=
 =?us-ascii?Q?M2ss3+kmPo5Jzw/Ig8bk9pMYwsJXWETSL1yWp7/FummkQduOplJvFZ3fM0+2?=
 =?us-ascii?Q?O8pLjyOuOmWDdJcrNpL0PF7yMgke97uGzCR4V/jxRAAVAHs5qE4fZU2uYNwK?=
 =?us-ascii?Q?E7YWCEqL2euel10Y0kbp3gaEY2zLy7/RyDD/iLQePy5Kk8UQoxbuyW1X6e0t?=
 =?us-ascii?Q?Yy8FPp/YpgJ5BNaCuKhPEhJL3mXvud0Ht6vZC3dhtjAqbaqNfpivCtNTuAsx?=
 =?us-ascii?Q?XWQcTau0uvPLY7uZjTW4c8080ymCVuR8SfW54GNeR+VswHtf3pmjae/FpZmm?=
 =?us-ascii?Q?AmNiXJKqH85dm+holzhC1GtqQbD8y/6ETbuNRHfTBAtz9/IVsL3l9UgFyjJ/?=
 =?us-ascii?Q?w5eg2lZeU81F3Rj4WK9X3tuYrh9jmQIatvqpoWEqfQk2c7PDUUMqrJpCSz3e?=
 =?us-ascii?Q?anJtqX9kkw4+qI+PWGy2Bu+K/4Gj2LKShodOs551+QOcpSvtP9m/lZLHklPB?=
 =?us-ascii?Q?VkCkcGNdomH24gQfW/34bdpGOrx1ZE/4rMibp9EV7Yaq5XpFMXGpwwZd9FO7?=
 =?us-ascii?Q?LJH3FB8NwrjCdSelUA1+Pe/3amLhXoj2gjauTuBXm5C8ML7mZWCwvJVyHf7Q?=
 =?us-ascii?Q?gpkl9Flhc1ofXM9noxnsLa6wY82fvdX3dHdY9uAHgmod5OFL5igPXSFkDY1V?=
 =?us-ascii?Q?sGTUa1UwaP6u1xhxLVNjOX0s0NNbDRjdGv9u4omgadlnxhx+6VbKh0pphMt4?=
 =?us-ascii?Q?9DrVDczoO40NWFkwOFDs/k42mTq5AainEztXFBc3cJpkYsvApsP9VCV+1KcK?=
 =?us-ascii?Q?TCogxLw8KRq9YfuS2ZcgNrhJEsSzW+W4v7WUR08cKm9O3RsEaW4IKDvMXntl?=
 =?us-ascii?Q?SFG9ORYl8xfqR8OjA3FO1Qk+m+NkS1vpLatqdq5GtLXDP8+UnwhDIGDYtH/+?=
 =?us-ascii?Q?NV+3KFMLPCNMe1UCNH2vMplnPQOdLQJCW/8FrO2nC6KukjYOhSjgguqE+6MB?=
 =?us-ascii?Q?Pp+4kVFT5U+yxdAGsd13xjx2kH+W3MlD1GmxTGRMqW/s9wqcNXlvJ0eEGojG?=
 =?us-ascii?Q?Oq9i7p3XrhsMJGfgj3PymqxTkXOlqGbqQVaa1LeF+FRBMXiQf6blXUK5q3yJ?=
 =?us-ascii?Q?On/DePDxm9TPfBAhg2HGBRy5KtHJjTIk9/0D7/yQqB5cYni7NVViraCXV6A2?=
 =?us-ascii?Q?pbWiU0iXtHeF7OMLad9pCz24heQLnbtBSn9IytlYLA5HZg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wLkneg0Eml/kv+gou+CpGhVFINjEIyPpWtqZ6xU+3UhZRhUH2sRizliOgvEB?=
 =?us-ascii?Q?kIU2zYvtEc9HvhWdTsJWQCQNe1UeWPWaeUdzVBi+Uepa946/6lrb73vQF8P+?=
 =?us-ascii?Q?ITF1G8IhSTsC3ueokkcUFxE7OMCvjrfuRHbkrkTI0CYjxh7KW6iNmjM5P4o0?=
 =?us-ascii?Q?fn7GFU6cGYqHmTiAUj67+sSEj/j8nklu1duRMj5DuYWQh6puG0471GdzDnIA?=
 =?us-ascii?Q?SwDdkp0KPJzUPLwTT62KBXbU2+zJiFVFfGG1kNrncCu5F/B+Nrs6dZcxcm6k?=
 =?us-ascii?Q?tKLopvRBxz+dMVUHAffN6InnH6E1JMvpBjW2UkLQrEuY5NAmxNgBt7nBygZZ?=
 =?us-ascii?Q?z6Sa6G1RTMFswoFceMBGQ2BxKceBiPAJ6pmB4moHWj1ecciJwdpA+dJNOiJ0?=
 =?us-ascii?Q?fbi5d8uGBISBEhTM/K8exKpA58QHump03Ip4p3tvSBTrgyZRi+pxH1malu54?=
 =?us-ascii?Q?YvP6vK0XeLmzbMRACEE3nyCRVXEFLdjqrFw19yWdvuIbVJpukS+kUe0kp+8F?=
 =?us-ascii?Q?zRkm2Z+L9nyaGbIjZsUxqe/I46FVt9rlUDUyl00J8JCY3t8xf2XKYzhjIDF/?=
 =?us-ascii?Q?LNTDzgF+HoSKuNqhCpK13dUV7STsY/BpUJqwrk22tHw05dccOnC2AVtGJSr3?=
 =?us-ascii?Q?V6OU8nphGl5812NEyQ/uHj/ydUi5Si5qYJhOMoL2BJjjZoGLuApNj4T5a5js?=
 =?us-ascii?Q?K9Wjkm+I6Y5pAEqLKERvppESqfb7aQAIP6kvKyUxXOmRfkw1LSh9T9SYT7aL?=
 =?us-ascii?Q?o8xQRCdK0SDO9vf/AbDXF6djFhIINlMyWEJvd0qlOzcqV8+L12wyPy9T69X/?=
 =?us-ascii?Q?0w8Tk9lzjpzxWIdXGEUPS1uKfYQpztxlJl4LQ95GtoN/u65yCr9wMxLcOoPm?=
 =?us-ascii?Q?OxkIR1VV+b+4YLofIg72jwQW3zIRrYZci2IE4WoFE9nKynagF8kJ8zm/aZDa?=
 =?us-ascii?Q?eAMlh0CGO8Ok2/VlM93YTZU1kl/4d87srFVluuwDDy11s5bY2opxkGqKUsPU?=
 =?us-ascii?Q?anY8hhs3535kUht2wOY4+DBhtiVHu8bAkGb2ncqsGtxw1QHxz/rSc4wACP5+?=
 =?us-ascii?Q?+lDlRDHl6lysjllV5I0ssSXuLrHD500iKdGf/FDniifNzOAOYuW2hPifRrkT?=
 =?us-ascii?Q?GvemOKV4hXBqpED3ILFVoh1bWwOsjZRwcXGv2Zkg06RKfsaBciLYy+j+7D1P?=
 =?us-ascii?Q?epfib+Ii+1dk+Mkkr97dUTIn7gTSCYRxZjlaVmEFaI+xRM0+M5AgktI4LRm+?=
 =?us-ascii?Q?1ABOyTVM4V0YvRYoJSZoWZrrY97qJY/MQywtycNd1Dar3R2PPI0xGeJSyqlT?=
 =?us-ascii?Q?4q9J0UW544HnWeAJw2Jm68FPzISME69BNG498SemIvdemZL0Zj0/f0a0HpRk?=
 =?us-ascii?Q?NMTzy5+kEWxzpuqljqLBFhPHKBqKH9RIgwf46CE+26iLJp+1m0/Ewrgyi86n?=
 =?us-ascii?Q?WbMzaw/9Z8sg0tYlwq3bXmWhwbXuhTh9W7Xq/PjZZtDmzOhLDCIKv5w+KTwl?=
 =?us-ascii?Q?F9oJTszVZACcxKaCLCFt2v+aj3xhzxKShpOt861ICPHvADNw8ON1pcGl8AJn?=
 =?us-ascii?Q?C2z+DRj9Rnho1doe6rg8ptAer5QK2TbD3uYWY096LUbl2NGTpi5uFnd+glUs?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Kw73aNltJUz6dI+g+pN/1ljuXbRrN/W0gCBmTeoYqKIzvOA9UHzB39yqGZ/qcqcvE8hxFUMunl3nRswfp0/wWHdP+ucjZoE+9TGx2l0D+/H/53oRCDCKCWFWjSdRfFdDgAiQf9dUqCTbp9mWYnMCSM0k6bBT/iTfFW0/IlLM2X4qBm/iyrSsxZHMsDixSP6oSE03wTQm1vsWi6caTDD4u5Q3ytlihSxEeuxTK4yrfwmc2bdPHAT8x9tNWHMW/8EM/+dLC9XAIUfES3DS7+WIO2Tp/dYMLsjIGk9+jn6oInI6LGX3u0bklG0ba9suQFr8L0aoxVtyHSa6sgGbgDMaKZSYiXDu4MQkCEK9pO/dXgPY+neexCmNS2cUpGmAF1wTt6DP2ZHfJneQAz+FjAUV9DUZwPSwdrDimKDUZrRKWpCWQIVYZoZ99l7hKZL9MyV2HxFuOxOTOJyqjUa5AjVlM0gLRub/H+RX8N8UlpZmNl1uLWZoc1ELcZdptQcyAxpKmI68GqXEIPGDi7o0ibADXKKo8sgitFbSuu6jkSpUtrJXEc2qnfMAqTpuCL4NI81Gb/3lVDhF5vlO0Vira2yFWt8pXWL25UOFc+pzDuczzwI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80fcd389-ab0d-4d9b-a6a0-08dcb25ca1bf
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 19:03:30.1893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPWjQIJp/mB04794TgNKbaXqac1MNpX0qTmOYBhpJ09kDNYGqsCtiTlA7rHKOAOM568mU4vxiMvVQEBFszN6q29I1/M86SQ/Ylsq8huIUbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7035
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_17,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxlogscore=731 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408010126
X-Proofpoint-ORIG-GUID: Ttbs2Rk9QIj1z8pwwA1JSscwcQhXl6Mb
X-Proofpoint-GUID: Ttbs2Rk9QIj1z8pwwA1JSscwcQhXl6Mb

On Thu, Aug 01, 2024 at 07:44:35PM +0100, Nick Alcock wrote:
> On 31 Jul 2024, Kris Van Hees outgrape:
> 
> > On systems without CTF, we do not know the type of kernel variables.
> > By doing an explicit cast to int64_t a negative int is converted into a
> > large positive integer.  The proper cast is 'int' of course.
> >
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> > -	trace((int64_t)`crashing_cpu);
> > +	trace((int)`crashing_cpu);
> 
> Hm what type is it actually...
> 
> ... int, but it's under arch/{x86,mips,powerpc}. Is this test going to
> break on other architectures (like arm64)?

That is why we have tst.kernel_read_neg_small_scalar.aarch64.x

> I know this is a pre-existing bug. The cast is correct, so
> 
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> 
> -- 
> NULL && (void)
