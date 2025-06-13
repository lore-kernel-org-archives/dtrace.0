Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6AE18E377
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823842; cv=fail; b=MxcjiB94i/paqhJEmPmd5Cza8GkdB5YCv6AkUZvi9a7KMuMlAaRCUqDOD74HELr+Az5j2aiV9nRoUYAU2RCxAXpylGdDjtU+CPHIF0wUYY/McyJcUw5/NEhzv9PrqrlspkpFH79J3ytkmU5Z8YXasMdvPqLsGlqcl50zfKx+Kcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823842; c=relaxed/simple;
	bh=3VJaJP62Zap7t4lHeKxPHPYYEE5lVtz2iwBSlOmRofw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=ZJS/71yYuVOnXwpeGyI31BpZZp16K1b9D982jyZ6o/VVLi38h5gM1awBAhBRKPaLsp6mBYabouo8egnwQsk6gy+mcCfnq/sRXjRn1nxbZ1McEWV3GuZRm8eQSLJmpvIb3U6UHPZnq+uo0pWQ7affRbULvie5kX1I4sle9uRU2JQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SZ38Q/Rk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PP0kDSRJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SZ38Q/Rk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PP0kDSRJ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtfKr005829
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=yY1vvFgzRYdK6+QziX
	8Kyrb6SthHOIaexlBdacSvX1E=; b=SZ38Q/Rkl/i/K7NuRwoozqu0cG1dUF/ddZ
	nwU7aQcRjeg6NZq71pGlQccsTKfUWQi0w0bBgHFSYi2XB63rGWvqxjhbSkzqM4dY
	3BkDBLCZ18C8fSxqQqYd3+jVS1spFb8/ceHi4T3JXpN+iFCzujrWE5K55LDUXWVt
	clE8guxecNCO+ATwYSC0TPvWLPefhe2ti9kBzeayPYxj075ZJrFgrh5goBz7SfeW
	dKsVB2UdyJaCfTEUwnGOmfxJmIXD1KwtkBwcmpyC7HXaVgljp5Ia2wnyQdetadWE
	iGbnpxCd85+WMoWqo6qrVuGMX02O/bHiwnyueGPQCFXVPWRoUHkg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbeknca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:10:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DDKkaj031895
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:10:39 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvcy1a8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:10:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPJmXBSqeQZvNGVkv8LxqlY8upEKghpmqckdpLiRSMbU7SbMaPHaMB5/Pm8MHKPLBvYE+yptmxkfdshRMKER51idkgSfZZ2B5k163BqrCmdI91FoIlv3VtsBdGQSd/MMlqnEQT1IUB3JxUK5fOXV3MJFEX1zLheI8fhCAYfesOkqSBVs1xDGETiyK5QwxsD9swhfslWGkthfk7tn9BHk8JNrkv+bqlodmj+VpMm1xx+m7ipPl8aWPrK9W7fG1LmqUFPwFu06Rt+uNo7FWkOEEVTFQEn7defpUxwBTXE3YLisbj9a+fXGLobOVBpvpAIeMvWDsywMmnl0XedhCJI0Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yY1vvFgzRYdK6+QziX8Kyrb6SthHOIaexlBdacSvX1E=;
 b=OGEZuBFZwrpmSpQ8m904VYz1kqNCzHavuRjhVnzhJ3aY7uHSK7nPK1+AV2cmzwE8vKz78t7WA+4EeXVqAlg9acYKTuKn7MjULl5TzYFxwDri5clE3Rc4dbXiIdn49dzMla8ralG7bz/qKJxblzsp5iQ2f2sdQRJXqVTrH7pzmYELriISZ44bKQ3uGLsMY0H7eGWi0/Oii69pKfiGx0heM/rOM5kCqnzqL7u2X5ehbamtXdqPVZNfRsNRG4v6i4japUuBteyCYj7mgxy2cO6K8PggmWDt2Cun8NsZcS2jGChVpuUMoH5t6fUevfxO4UJ0X3Cufs518URECz/u/tGPwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yY1vvFgzRYdK6+QziX8Kyrb6SthHOIaexlBdacSvX1E=;
 b=PP0kDSRJ3LaiZhloUE3G1EN3YDhZLAKHZFrxtF8d0N23JJg5eWiUb4FeD8oTIR/swZ2jWJWJUGY/gOEQCcmqgnhy3whYUIxUOLq0a+4pjExQK1X0JQusduqMQputS6/5vwdiRc/UYIUXgSjK7H2mk0tbEaL3jWCNUul07iRjVbM=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by SA1PR10MB7664.namprd10.prod.outlook.com (2603:10b6:806:38e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 14:10:36 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:10:35 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Suppress some white space
References: <20250609180647.4424-1-eugene.loh@oracle.com>
Emacs: it's not slow --- it's stately.
Date: Fri, 13 Jun 2025 15:10:17 +0100
In-Reply-To: <20250609180647.4424-1-eugene.loh@oracle.com> (eugene loh's
	message of "Mon, 9 Jun 2025 14:06:47 -0400")
Message-ID: <87cyb7enqu.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0318.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::17) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|SA1PR10MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: 769cbbb7-7302-4a94-cbff-08ddaa840794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HhQ/Dm21wZYZmsC7+MWdVgRVVUKFwAjCNShjWrbjqlsNVUKHrHQdSaIo/rmZ?=
 =?us-ascii?Q?V3HMAutw0D8fFvp6J1lvBsEgHG0Aam+IkN7s296DroN/V+iRfVf1QnowtiFh?=
 =?us-ascii?Q?4EkDrwoLn7xmrIzxBfasrQpHT/enKlvqXkEmSRVnxxwzBmKyfwaQjmb+MMkC?=
 =?us-ascii?Q?mRtK2RivSnWklldCBfdxQ0d+YmVoBGpBChbEz2rxMOWDP36kt5nVzaOXe3ya?=
 =?us-ascii?Q?DbAeToutdpCRWpntq1T7cuLCdN1Ty1LQHF1uVt7GA3HhdHWTMWgpoE/wpVOd?=
 =?us-ascii?Q?zzXseYSCsD8ZBxeCJwFpV1kjm1ywm7qyp7Lj0f+BfkinD1oToQpbDLmN3inb?=
 =?us-ascii?Q?qgaA90g2IZwwLJer6BXR81ahD+QWHe5ARgW+9Uj9j5nnGqE3hDXPVo5aFqO1?=
 =?us-ascii?Q?FxOuOt/NOjVEg1mORNGZvcODHSMQxehuECvv71ZL8Huoz15WY2Vhs+u+on0Q?=
 =?us-ascii?Q?1iwKJaH9YYK4mVzugKt+wOLrAlLw47CEZ+x/kClif3E/K6Uv7v3iLbd9aQCh?=
 =?us-ascii?Q?vBKpKqOOUqY8H1bhkhJQFQMKFbTd/psXmAQ1++dEtkjWrZBrEPk1QC+P4gAq?=
 =?us-ascii?Q?vnpFnFwRWmHTYR7o89Z6DsJOMNlNm6ZruTok+ALfmohiGkFJHMehgAIYYSje?=
 =?us-ascii?Q?5rK9y2puVN1UjSbhBBg7R1qJG7h6He74c6zb/fZuKNyuc74GAbqsVf+yKzO+?=
 =?us-ascii?Q?HIvgY7MLYA+RKvCcl/3v8r/TBwb9Kp/XRs8ECc0trD8t20JBtsjxhzGwRPyg?=
 =?us-ascii?Q?+UKRdnCEth/mgAP+QJ2cEQD7KVOrsR17nkjtsB4dx3LAj5CTwAmhla5SFLFf?=
 =?us-ascii?Q?5GCoI2TGx1+HjEvP05gVSilc/YRO/1tguj8PzXNfDbii1vlDfzplZrX3XUK6?=
 =?us-ascii?Q?/qFwmLNHszWH9uEdot6BY70ZD43CnBbY8noX+dQsPyYbhCmZUV+tJX9v4Z7F?=
 =?us-ascii?Q?LnW4KY51Ng0pz7LYkNnAUBy4GOhbWbxfR5iZiI9mEcwpAQGlUMjEixSqKLyR?=
 =?us-ascii?Q?TbonE2NCv1B817+I72hPuOU9iNOTwTljLY+aKa8naF7VwMGACoPd9ZNPpXjp?=
 =?us-ascii?Q?1rQpzPGwLaeQWL4so0/xTyjcJgdtT+SUp1ZLve4xi6Dd2mci9BO8VgcRlXVS?=
 =?us-ascii?Q?1+g2UadkhvsA8W5MfQ2bbRLr9U3KTu5oKRMhTyhZvzTmNYXTv926+33kbsnO?=
 =?us-ascii?Q?Zgl1GItT4h0EOiYmXchGvufBHt4csHx14i1RdmLEq4WU7eIJV4R+Ejei1eDc?=
 =?us-ascii?Q?41JbnZLt/84ciYdISaUgwMYPSBaBRwWq+Mg0l+D7Sej+1NbGg1Cimroju90n?=
 =?us-ascii?Q?tdYGZxCojhcHb+FDXm0grzCnGPaMa+Ph3jM7jNq1oKli8MzbZLpqWRBVxN12?=
 =?us-ascii?Q?rtx5hPshpZtNyfbWZVR6jEZ+0i0SGq7/jDexlDHjadAd78SOuBLjSdvUS0we?=
 =?us-ascii?Q?JW2booBPhOc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gzlwnylv6jSAV0PgOHuOXvdnXg5bhMqAlVJUsPT4/O3MEEQqmCobZ7H2iN3R?=
 =?us-ascii?Q?eizHJ7rjn6BHpDIqsGcjd7vphuKVbgR7fU5T8YF4z34UL6uE5xzQ8As+BzA6?=
 =?us-ascii?Q?N8lIEcwX7PT1YGXkwMcsxygEdl2c0c26mOBtwqmDzfHnIrsQURNpp4oQiNVz?=
 =?us-ascii?Q?iu+L2+lTYdmjiGU/QXmTGUy+ooLpAZNzVU9uxDh/dfI3zWMrycRwVy5Ewau+?=
 =?us-ascii?Q?u8TPEBqZ2FVVylOPuETgdEDCxW3Dk1whN7hNG0G6gjmdjAEUrY2AQnqjUVHS?=
 =?us-ascii?Q?bJlxH0H/TIQdsZedDvamsgSi8oZ/qqr3kiyzUZ6gludaudZ9HOqU51SgcV/N?=
 =?us-ascii?Q?gkYdzOHvRwVkiE5a8xdcAvGQvjUchzSIRJbFwiP6quUGHkngP9wm6FV/jdg4?=
 =?us-ascii?Q?HhW1E4uDEn/fCQUpm8zdIN0s7+CrPvmXoukosK/ZBqFVsgjg7tI39HEGva2V?=
 =?us-ascii?Q?8po8Z+3Biw/LPaHdqi6rMePBwBEYbqSKe2b1yDJC6RNmHfV/JmIBfEf9Fry/?=
 =?us-ascii?Q?8ng39KPUIKmDA2MqV4UIKH+IQAcTMaidZeBPAa9XV0yEGFI7eapD7LoweOVg?=
 =?us-ascii?Q?VniQNkihtxlW6yCUs9wHeQoC2vJqJSnkSfD8anTAlOEIQoE+YDuqtNPHKlP6?=
 =?us-ascii?Q?YSAU+uuXhq8s8x+G9SAmOrpkurGy9ChXXymGMDbL4KqwgXQ94xKSMQykHG1x?=
 =?us-ascii?Q?Zeom9AfK/aBT3lNF1BAh58/enDiHSyiIWH1iqkPNsZJ4SakPEvDz9smOPh+P?=
 =?us-ascii?Q?0hbNvfHAOMDrFitjoDdmf1EonN4GEeOV1T96nkr6yvUchfKvZmwVCx+4+Bjy?=
 =?us-ascii?Q?6IYiXmqopPiqtari82Sa1nTvpu1IT+N51b017URyrFc+2vJFBKM6WNUNQrf5?=
 =?us-ascii?Q?TdyEbdzD5DvuOk9g5BU0I3YSuIf6d+30Zz6Yp73P4qtI/RCKTdCEYOC7PVbo?=
 =?us-ascii?Q?70UWj6FMeUS/ReIChjXA/c6JXcNY42g7A4Ys39BPPBCkm4DkxlGsKUtcXXlH?=
 =?us-ascii?Q?wpeVccfHC7w1IJ7Prpep2RWkoDTYtoxZtaF3Y75DMNzkdnqL8Q/FnE7Vr5QM?=
 =?us-ascii?Q?xcdnTox2PRuLt++Z73N47VKZMtCYlfLJf2ynNV5jkBM/zeMXX2FkyeM/fg3u?=
 =?us-ascii?Q?Mkc5HaaKb0u+wyx/2ObhecZudm7gmWOEccXymd3vcpMNojZnATb9RgIIA8xH?=
 =?us-ascii?Q?lQ+POIHd5jEmOxABfodcWg9d57/2DguwtBCHNgVNbX3K8LuIXdGnpcSbIQuJ?=
 =?us-ascii?Q?pCbFQwcQZ/KhoBbK8FHhQqIotM8Vbr9QH0tQGWfDJerJkNVQhx9T5wj3Debs?=
 =?us-ascii?Q?1uA8JU1uFY2msCitK5kXiFd+9jXYc7AXK0iowwi1vKcFZHZzvEqNRpjbcdb2?=
 =?us-ascii?Q?EhHxhPHHAhs6cOfmyjPRpBrY3Wd0YC/dSHBJoUiwh/QplXHI8mCu2Mu5Dx17?=
 =?us-ascii?Q?CEBbzAgUblKGz3Yf9CyQJGV4NmzeuR0LjfFTQStLb/moX49JuziA7GNQzeZ0?=
 =?us-ascii?Q?mwE6mZL7C9prJt81M4Oe1vNLzsk/PR5irViJkpXUSdfjd7h1kuvJX8rU8yHP?=
 =?us-ascii?Q?qUfxe4UoDTSK1Yrxgexp6DSsCh5DwWl7m8cy85vykOox9CGD65HEyRGqDnIh?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x8T0MKGog4pYcxM8jcfrCg/V3ljBwqU6RfGtm8xY1TCsOWnyMiJr4lsh1K6I/eP2j9Mb7Kj0klcsWtfDOetXVEOcNXRDQehhEEKgU6d1X62AtWNFc5MdbqALP5s79otdATAiT40E2XJXuWTsz/kJOLQqCdrMZgXUrPA/1mKdb3MTIBLvHKXvGcF1URBTbuGLDqFuJ0TvFoXtKujzxEN8pZP7OkwUcutomGGAplcqYqKnlkvpFD2ZN+AjPYkmn9XJGHAzXgYwERRNvcFvdYd7b+042aNZ1lZI6Lbu3jOQAX2QKAuaBIEeLhtUUqKIHb/SAPIN4EyBOUqdKdOCEBAvd7F4P5bo8kHes0hpZen2hcn74WYGZoNXHZH9LCdPZ1XGc7zAmqKBjN8pSutc6JRu4y2NHh6aF7Q7EL9Xh5D1wGJKbOCDhRJlj/2NChLSMjYAH9nVYK6O6G0SGvgtXOJhcZ/oFFkwCOrzFPa+TMAy0yycTUWpzehy12SBbwbyg7KhIBig24L0AMHuuGCbHvcCOS7dF90Xen2SAP3lqXUYEPJUv6Ka76PMcZ+a7LjdM0hWOmaMUrjaVZ6QR8OenSqbIO8khVSnQms+svT58zadPXw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 769cbbb7-7302-4a94-cbff-08ddaa840794
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:10:20.0034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oeuVn7cMrqxv393mvF3o5Rjdp/aLAaxiGvbh4IXKSuMc7+GZqlPCYzMTJTQSwb+PmPkV4l8hStyEB0QHqW3feA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7664
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130104
X-Proofpoint-GUID: FQ-KQwdKzSlTMVmOHhkFHiKvYiVCdi-U
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=684c315f cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Kbcb-2t_chbDUxbjIckA:9
X-Proofpoint-ORIG-GUID: FQ-KQwdKzSlTMVmOHhkFHiKvYiVCdi-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfXy+w33d62WkZn JOPva8O/JaoX+93pW0EyLbhxz2yJ6G326bkjwnuYgcQ2SKnClXg9H0ar88qnvalv6YDbeSwS3XP wnrXUHAmIoFBulZfwp7z309m09yH1rH5mTT63FzOB7SvOi5zSwDZpr4dPNbbaTh0NR12ZNN+7KJ
 kU0vQDGcjVCCY7XqEL3mZ1T2rdOdbQZtUfPDysf6gFMlIakfMaBSUFMOepJ3HKfuZbimEw0GCUt 6wWHe307V16UKD8O73b8vaAUJtotidbRkCdezIyNQlsnAx51gfRnM57MjVMcBLuXi9D3QkcihM6 7rIXGVLMDVFN/p9KgkWlgG+izvyZkRq8h7YJGCunMljAt7wcGPVmIg4lLzWZsSiFmAJbAfHtaNa
 4JRD1jwiemghPN1lvgy9Wq1hNczvjKY02iCh3gUgkd+VOD51hxeqmUZXH0nZ/a3W8wCUUdJH

On 9 Jun 2025, eugene loh spake thusly:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> The test suite turns pointers into "{ptr}" so that results
> comparisons will not be sensitive to particular pointer offset
> values.
>
> If these offsets change in width -- say, from 0xf0 to 0x100 --
> the amount of white space in the postprocessed output can change.
>
> Add additional postprocessing to a test that sometimes fails due
> to this problem.

Hmm... this would work for this test, but maybe we should change the
{ptr} substitution in runtest.sh itself so that it gets this right in
the general case?

Something like

diff --git a/runtest.sh b/runtest.sh
index 156e7dec8a1c3..c5703a81bc6d4 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -509,7 +509,7 @@ postprocess()
     # TODO: may need adjustment or making optional if scripts emit hex
     # values which are not continuously variable.
 
-    sed -e '/^==[0-9][0-9]*== /!s,0x[0-9a-f][0-9a-f]*,{ptr},g' \
+    sed -e '/^==[0-9][0-9]*== /!s,0x[0-9a-f][0-9a-f]*\([ \t]*\),{ptr}\1,g' \
 	-e 's,at BPF pc [1-9][0-9]*,at BPF pc NNN,' < $tmpdir/pp.out > $final
 
     return $retval

might work. (Obviously the lines would no longer line up, but the number
of spaces would remain the same as they were before the substitution.)

Lots and lots of expected results would need regenerating after this,
of course...

-- 
NULL && (void)
