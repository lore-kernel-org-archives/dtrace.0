Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C421805A
	for <dtrace@lists.linux.dev>; Fri,  7 Jun 2024 22:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717798977; cv=fail; b=bMhmwjyA0rsechY6OGMmSgXt8lDLwQJRYd7APi+4dw39FxjZdWc9hDHXdrm1B+SByfNWvxVvivQJDWqaw4OoEvQimZIfdaFBDTBETYoacc8RjwWNyv697lxS/MY0R5qBOvNw/sybTTQ8QhDeDTdR3+AfKFQKdcBOviC3fIqjoJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717798977; c=relaxed/simple;
	bh=Gf6EZZ0ZfUvZOKBZVXIaFETBDKeGbOxFExVVul02FH4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TtYw5Qa6hNCAencxXBu0seq84ATRWLifRi2d+aDLqQp3T9qLgDMuZA7IBpOkAG/7bXaPQTpsPrmWilh5kw50SCTckXxOLJkFMgdyJOqcadnBNMweg6o+6s95Q1B8WrefcZFRSJ8sm7Ljf2Nt4GHI4YwNJtSnh6k8f4VXUj3HaIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OZtWhLCn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PhjhnVZD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OZtWhLCn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PhjhnVZD"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 457CuULG025420
	for <dtrace@lists.linux.dev>; Fri, 7 Jun 2024 22:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=SjnzqWjxe8K1uBGpG7awK5Sm0y06j/6o9Yt/kCgJnMk=;
 b=OZtWhLCnAqV9Swrgokn1qTtPcC7esc2ndpVvsbzs2+d+u9U7l3SboChXFBJ2ZCWu/JBe
 cq+lO0/zEK18a7gw3olsMmSqHWAORZMZzsmc80Ry27ATjlnVlOzL+Wfc4SNUu2GNu7fG
 8gDkU21wtyOIy1fTLvJe8VQz9/iOXW7UVHy5CtPx0d6TqKyoWfOESNFA4UzRotCYL2fR
 70kl8ikjpsdWgXBXX6Zx7Z9h5m4esIF32b+pmVdN1Nm7eB9pwQm1LaD8sFw41er0xJVM
 udyS6EMoVDZnKaRUYztMyOBA2izX6LHyRGUATXn40UyBkTFli6EWpMX+DphzwTK5RUJI 9A== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ykrtb1tnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Jun 2024 22:22:54 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 457LRiVc015624
	for <dtrace@lists.linux.dev>; Fri, 7 Jun 2024 22:22:53 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrjh6vhd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Jun 2024 22:22:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcaF2g6Ga3WtWDeG3y834J55GNrlGehVgug0vKzyefAh2AApNUmJUFMZMdr+KjkXhYpes3NOCuJDqbS3ZEbfOxDZlyDpSloZmh2Te9OcKRNu+ExhTTq7gbgyUj00K827ugZIE7OtBvkmVeftdICxeQOIh0g+R2zkVbTehvrctXO+sjF4KENHZih6vuRplMtp2mhcGUENQTmiNGqnKtvgYBt/tCcj2gRxlBsFXhZwVUdL1AGW9T7pJ4GNNaVNUSZr22+islMQLFfvCSrdvbvN6mcAQjyCjyIEuGc36xYPh3kGcFTwPvUD+3bnlDRqpUPpEH20UJlROEUxPeb9JMU3WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjnzqWjxe8K1uBGpG7awK5Sm0y06j/6o9Yt/kCgJnMk=;
 b=NOA4vAQoTTI/dStZkXhx7L9xozzbGlVK4fh+fqnn1DfBOZJdLnRNDwToJxjI/WNgwhyNus/byhavgm1vWgynXLw/5UqEBrouQF/Ay6Z0aOLhysf9yOTPAxju8X7SkyVojrVlqFac/RmENJWQ5ch0a8PXn5a2cuRrpAxRozipNEA5gAkhqAM46Qd+KRs2v4iNZNc5lWnmcfIFhZa1bbvaXNebWQue2elCuQ6kZCLXosrQzS4yOPX4FBi5DJMGwdOSeKYdeH36M0vSVanvEavys/X0mftY0k/dcYAjaD5TJzKyr8/QdOGGlzx4mKeGs59GQF4r+lb54POaHcnkmzIWnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjnzqWjxe8K1uBGpG7awK5Sm0y06j/6o9Yt/kCgJnMk=;
 b=PhjhnVZD5wVSJZnXziRUHqTThSruU50f9whrK7zOsxovT2JvZNDPK7n/pwuAwXEIP9JCqeOVk2HKScbQ0sCk+uNRnhhCdVDP3wkr3rSe+v0X4NAVworo630ORpN//krKY3ZgLJEt79+8oPiDemfq/X72IamDKbPOakrVhQmHlK0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY5PR10MB6213.namprd10.prod.outlook.com (2603:10b6:930:32::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Fri, 7 Jun
 2024 22:22:50 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.032; Fri, 7 Jun 2024
 22:22:49 +0000
Message-ID: <465218f6-ebdc-ee51-fcba-86faf1d0824a@oracle.com>
Date: Fri, 7 Jun 2024 18:22:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 03/14] Let USDT module names contain dots
Content-Language: en-US
To: dtrace@lists.linux.dev,
        Eugene Loh via DTrace-devel <dtrace-devel@oss.oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
 <20240604181113.11505-4-eugene.loh@oracle.com> <Zl98PpyXNh2aSbCL@oracle.com>
 <b3426a7f-c611-4758-a077-5f3aa81bd705@oracle.com>
 <87v82kmvx6.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87v82kmvx6.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:208:d4::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY5PR10MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c63ef6e-7353-4c3d-3607-08dc87405d6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V3VMWGRpWUVZM0EyRCtGUXBwL0FMYzFQd04xUHdOMi9oQWc1OHVsamdEQ1gx?=
 =?utf-8?B?MWhkRmZkQ1pwK05Va1hLcThoODNITUhIQU1keW5MaDF4QmU1aFNjWDdCdHoz?=
 =?utf-8?B?MitMczROeTJiMDMrTE1nTGQ0LzhOZk5JSE9sR1NvOEhvalBuY1pIYUUvdG10?=
 =?utf-8?B?VUVHN0ZtQ0VPbXYvYmI3MUZLRm1iQlJmV1RFdlVEWmFSczVPQXFhMWR6ZFhO?=
 =?utf-8?B?OUtsckpJVUNmTzlBMlU3TUxCTUYrVXpwYndkTTlhT3RJRlo0YXlXSGdXaE1X?=
 =?utf-8?B?MTBPNE1HOXpzYUxjNXZZKzNUbjV4TXp1b1oyVG9EUHE0VThyZWJKUGZ4MGlr?=
 =?utf-8?B?Q3UyZllQdHFWOWFlVnF0cmlXOEJzYnVlVTdnWEdPNlBSWW02b0JrRWRoUUdZ?=
 =?utf-8?B?b0ZTeVFobmFLNyswZWcvZDRMUmk3bnl4MGhJU1NsNHJnRHUzM0tubDIxS3ky?=
 =?utf-8?B?dUlCdkF6NGJEOEtFcEEzMVhXUWljME5BaWpOWkZHTW9xR1FMSFBUNkU5d0xt?=
 =?utf-8?B?WlpKSHZDaG1JVG5QYmxEdHNzQmxaUGNxRkdVMGVmaWdTc29mWEs3Lyt5TUI5?=
 =?utf-8?B?UG5ONkZHNnpGcWhuQjBDWkU5cFQ4a2FCNHhlc0FEOVFyQTdzM1FEL0hPMTlC?=
 =?utf-8?B?d2pRS2dZNzBzZkxnQ05TK2tJRm1JRFkyMFA5SnVpdnU3ZDhKd2dCbnliTUp1?=
 =?utf-8?B?OWwvMEt3S09kZythSDh0bmpsWlpnZ3hObW5JTXl1ZURqUERjM3Awc2lydEx4?=
 =?utf-8?B?Vi8zY2tMY2tJQjZ0WGtsd25HcURKeDZXWGE2emR4aU96NFA1QjJFbXhQcExM?=
 =?utf-8?B?Z1RLZXBYUCt1RkRDTmJXV0VnSnMvV3pFZmZCakwwM1B1bUtZc1lURXhXZmdU?=
 =?utf-8?B?dXo0ZXl0QWpkbkZkS3Q1WW50VFJ3aHdwb2wxUTJOam1TdEo3cWxKbXZBalpW?=
 =?utf-8?B?b2RlM0MySHVYa2s1NmcrT2hlMTZBUU1sMDF1SmxzdjNoVEYyTitzT05Kbll1?=
 =?utf-8?B?NW5WTVBmV3ovclA4eVVUc21sNzRzWFh5aTFiRWZ0b1Z0L2FFMlM3OFlSY3Vm?=
 =?utf-8?B?ajFvb1U5THVuYU52WnNWN1MxQUYzZ1oyNk1JdlJpOVNRM29DTnkxUWM1M3g3?=
 =?utf-8?B?a29wTjA0Q0RPc3lTNUpxWUdMRzNEWXNOZWRwMmVnUnhOaHdOMzVyTE5ycE5L?=
 =?utf-8?B?djVSZTRYakViOERYdno2MEtqNngxOXBwbzI1dmx0aitTeEtrRTJGVTVTd0tO?=
 =?utf-8?B?MDhjaW42T0VQY05NZnJWRFpSYnp6R0NLMzNjOWFpUXhFM2t3Q2swYWhiYzhi?=
 =?utf-8?B?VGs0M1RZU2dzUjdiQUxseFhTbmVRYVJPZCtWV2xKajlqM1lseFRweXNUUlFj?=
 =?utf-8?B?RGFpcHgzL2IraC9acWZmNEFOb24wT25XS2kwaG0yekNlWFFLN1lZVFljVnh4?=
 =?utf-8?B?V0Z6ektzbEVtN0hURFdyVEMwK1lBcUhsN0NBK2lkSGJQMEd2YlAzTW5CL0dJ?=
 =?utf-8?B?cVZkWjJFRFlNSGQyVHNxM0dDTCt3c2kwME5zakhMMjhhMzhyVHVkUVU3a05k?=
 =?utf-8?B?eENvK29UV25MNE5ZVzRqN1NXWlBnM0s5WkRoMUQ0ckt3NEM3K0pUMy9wV1Fi?=
 =?utf-8?B?UWxQQ1dvWHg0YmwrdlZoNlc0a0xvSlRZNDJGMDJvM0FBeEp1UU1XQWtkdlJl?=
 =?utf-8?B?TDNOTzV3Vnd3d2c3Z0dNRVRaYXAvUVBoVlVpWDBmRkV4S1FuK2JyemQ0UHgr?=
 =?utf-8?Q?k5DoTzXfmYJJK4RReDMdiLIDejoZxeD3ocB4y35?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Wlp0UVlKY0E5ZFZKRVZZNzdkckVMNm9renRMQU82anAyM1M2RTcwRUNGdHhG?=
 =?utf-8?B?OXEwOFp6V2VuMUttQkRvemFQS0JrZ2xBT25PZUc2QUo5VVEvaTV3ekRsbkdC?=
 =?utf-8?B?SFJBZkZsR3YrMlJlcUpLQVluTnArWnNRb05MM0J6cDUwR3ZXUlRkSlFuT2JB?=
 =?utf-8?B?SExHUnlFR3JScys3TFI3VjBWeGI2Q1RHM01QS09ycjIyWEJNTDJFRmFhU0dK?=
 =?utf-8?B?U2dtSzRoTThldXhWdEFKYnZDbk9MMGtFcDkyemloTFFTektscnJabkk0ekUz?=
 =?utf-8?B?Tnp2NzZEUTc3eGFjbTdwT01TUVk5TjN0b0dKL2FweWZUdUpmck5UYjgwVzFi?=
 =?utf-8?B?dm9nSy9TZWJXUC9Ma3lpL1c2Q3NUT2dqVEw4MUdOWUtCd3hCaE43M0c2dm90?=
 =?utf-8?B?YTNIOElRb1IvN3N4RDh5U1BVdGNtQm4zSjRkMS9lUmhqS1FScHBHc1hmOFY1?=
 =?utf-8?B?VjFkeENHSVhFWjN0WGFQQUxURCs3U2MwUkFlN3V1L2lmUld3MmxGTHdKaytS?=
 =?utf-8?B?Y08zcFRMNzlBeVNYRUpxNU41a3ZqQlJMamtOdnA1SEpHZG1BTVQxaTBnd01J?=
 =?utf-8?B?dnlXSFY0OVg5NUVyWkFBSWdRZi8zejhiNEdvTG5VNzl1TTlTUWNoMW14clJz?=
 =?utf-8?B?RlNxcHdTWkRpVEY2MUdLUUFjcDlIOHArK09vMFIrZVl5YnVYMEJlVC9mUnpk?=
 =?utf-8?B?UDg0eEFJNkhLK2k1SC8wYndIRlVCak9TUXRnV3l4Zk8xRjZCQlI4MGZxSFpN?=
 =?utf-8?B?MXNTZkd6SWFjNXFNa21aV2Q1NUtUeHllbWhQbjYvUzhQaWZLUXZuSmpWM1Fm?=
 =?utf-8?B?dGNUdlB0Z2J0TGtNQW0vRVg1RElhWklwdkdCVkgrZzg1Ti96dDY2N05zUVlY?=
 =?utf-8?B?cXNrbm10RUNyNDE3bXUxcWFwVjhMc0ExbXp1d2E5ek94NVE5TkZNcTJ4K0dJ?=
 =?utf-8?B?Mm4wd3U4NHl4RzBOakUvS1VaT3ZzTkFIVldvelpkQi9VbXNYaVJKTVJ0aWdv?=
 =?utf-8?B?di9LcXlORWhldFFrOExPQ1BoeGt5c2NxcXdmR21sRDNVZy8vTXU4NlRtUEwx?=
 =?utf-8?B?MzFhTDdaYk03elkyamtzR3d1WHg1N2xZL0ljbVdvcUU1U3dSbTFlNVdEWFBX?=
 =?utf-8?B?VitKMEJuVUx5QmNvaFM0WFNPYWdtRFRyZWtBYU4ySmt6MjRtR3RYNzNTNldq?=
 =?utf-8?B?Q0JvM1psOHhkd25QbjZmUW9sbXZyTDB0TXArY0tUVGFxRHI5d0N2em53VnFw?=
 =?utf-8?B?Tk5VWDBVUHZqd1pqRnRrZHJaL3FRcXp6WjUrRGZuc2oyTW1pUEhDU3o0OTA3?=
 =?utf-8?B?R0RBRzBmTUpuNzZVOFpzQkpIRU9JR2J5UFZuV2pKYTlwanUza1V0TUlXSDJu?=
 =?utf-8?B?NVNhYkZJWk9yRnNwL1pMeDlLVEFyRW03VmQvWUMwdmV2eVVvTHJVTkpWUjZX?=
 =?utf-8?B?bUsxSmZHajdwZ3BTVVIxNHY4RUNsWGVUaGJ0YzUweTJEb2tJVDhjZDZXSS9n?=
 =?utf-8?B?aS9KVzh2bnFxTG5nSzVJb29yTzZ0bEtMZ3kzMlByMlRWK3RnNlkyN0t5eVdm?=
 =?utf-8?B?bjFCUk5ib2ZsUmpnMW96WDRqQ2ZmeVVleHJncFFIRkxteHlGbm9vUEdZYjYw?=
 =?utf-8?B?WDRvNWs1UDFBcHR2dWVBLzFSRFhxMFRaTXVrM3haNVErdzIrd24zMG9iTVNZ?=
 =?utf-8?B?TEFMTjdkenJlcHorTGMrNFhOWmdwTkJzNE85VWlJNTd2U2o1OGNJcGM3blBN?=
 =?utf-8?B?ZHEwQXlFblkxZVJQNzdNZG9IZHR3cFNYWm9KbElueGZUK2VqVE1SZUE5amlw?=
 =?utf-8?B?dDQyeTFRVkt6WnFrQkpyZWdSUkdTVTNtM0hWMkFQcE5VVGpueTNXWUFvNlZK?=
 =?utf-8?B?OXBJUEs1RENsSHczRnB0L2tzcEMwY0cvQTY5ZFpEeHk5Rnd2ODNQdmplQzdi?=
 =?utf-8?B?dmhqUFJjUFV6LytNRUJ0eERqbHdPSTQ3K0ZuYVlhaVpDdHg2cStMRVJEME0v?=
 =?utf-8?B?clYvdDV6ZXZBUGZNamlNS2JxTEU4d3Nzb1dJajhkVy9Lb29ZMXRPK000alh6?=
 =?utf-8?B?dmZVSk9INHVVZHFyc1lXSTFIRURia3dwdkJDei9IZUhIQjBMMStTRkNrWm9U?=
 =?utf-8?Q?DT5ayiEMuN+pwSNDRg1OnKPAW?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	xKCEkjrxOWe1wSqbuKj7oiInQqvtr+G058wa5hXxBNCpZ87EC+y2Vcjn8gmg/sXee1ThJ+oOTt2on6Tl1c5KcTER3RajW+vVtDZGfFiHvlWepC5l668pUZzNV9nkE1+zR2vXriwPTZr2FNj3PVs4bQ6Jc0Ft57+AgNUVJjGY3Hu/LuRitcJRBGjGnjyE5jnttK1nTx9BZ9LLxyHNC818tQ/tMGZXee8QlSJ4/ltDEmBYoQLtm/lAV6oDDgH5d91pNHfmQK3m/nVhvUCKtCyvMXDBllY2R7V+CYpwdSbHd2LzfNWBaKdFxB+A+3ijuvwhqPLp8xjy0ZwnlnNUhTGHTRbduYKeUD+BqACcGvys3QOqVd1Ec+AkMEeitu0v8s6Gr8MTIVdGptT+Vu96HayX/wJouy820EV4qrh+7QqH8TUUhyhpl2894fJYp+Ljnj6/LXr/XupKCoZGbVAB1i7U6Udj5ln3L85rxhkguqkOKDqtuVV5POBkGCs1AR9dEi7zDFgS3Tzj10yeq+6MZTYglCRezGoSkSDWkIwo0cITP7pkOFYChwDo1qJAEv9Eyf2XwbBQMHO3SG5HEMkl4u477Osl1rAQl+M+17YM8456XXw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c63ef6e-7353-4c3d-3607-08dc87405d6b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 22:22:49.6307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHbaCbZV3KigqnUAPvdt5fVF8erHA2XoA59H0GjcvJjEI+4Py85zdWrnAW9FKcPKnytwzZLrSuw3Acv1T/OqsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6213
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_14,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406070166
X-Proofpoint-ORIG-GUID: MAeXC22BphrJE07xcByp5U5TnP7Ke2Kq
X-Proofpoint-GUID: MAeXC22BphrJE07xcByp5U5TnP7Ke2Kq

On 6/7/24 14:48, Nick Alcock wrote:

> On 4 Jun 2024, Eugene Loh via DTrace-devel stated:
>> There are basically two distinct cases here.
>>
>> In the dof_stash.c case, I note that we are checking a string of the form "%s:%s:%s:%s" to see if it is "." or "..".  That simply
>> does not make sense.  I think the indicated code should be removed.
> Yes -- that was a mistake. What we want to ensure is that none of the
> probe components *consist solely of* "." or "..". This has to happen
> before any attempt is made to write them to the DOF stash, and before
> any attempt is made to *look them up* in there, to avoid unintended path
> traversal.
>
> This is, I'm afraid, a security issue in the presence of potentially
> malicious DOF: we can't just do nothing.

The reason I say the string is of the form "%s:%s:%s:%s" is that we are checking a string returned by make_probespec_name().

I guess I'll turn the check into per-component checks and move them into make_probespec_name().  Incidentally, do your traversal concerns really apply to "."?  I understand "..", but "." seems less criminal.

