Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95691D6DB6
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750831399; cv=fail; b=GmQFjm3Oxce1hHBrjqQQ+KtgR+Gg2NSXQubBXb5nLz10uLBFYuVPXBqYMkrv0rHoZ9kFXfXTLFzzPSpDPzUyjedDlZI55nwrmk30Cqo7brBV424+JuFzY4VrP4R5HBIV1KFteeqV7niYK1u8tL0YRp7wtrVL8ZEZoaJn4253qGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750831399; c=relaxed/simple;
	bh=Np1yh/mAGlG32BafEF73EZMOluuG2JCXpHspy3Vy1bE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A32PDtT0ePcuD/2e3uVIna4bkJOQ2vOYFTpBnqsLEdXtfl0+BUUoaEDsHCK2471NrfFRGlo8+AzLho2lAlNpAaA0VAdALoHza62laUkMPGh3r5IjTNdP39SaMkIUhJbZMGfH8iJeH47rcsFm+FyZCvfLnQEcr/nZ/Od9lmsvQoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O8nr0hLy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ri6v82aR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O8nr0hLy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ri6v82aR"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMis7b002889
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=1QvKOfLkkXcn+P0rED
	AeX6d86tJxiw202qcfVevdanA=; b=O8nr0hLyt30AxhTTIyhQ67k+dIDBJas+Xz
	kIpbdPuN8iWqzS9MkNYuDoQUxeLPT3EVmVx+gC2aDDKLNGYZN7F1xPRGgdTZ6ZTK
	YrIn+qMWRpWqskuQiYLg/c/x7HmApOyTSC/0uDphwa70+GJhW5wofW582jUYfwX3
	wl8Fg0SoaF/kCPEkO07slb71VkMirAWL3K4972wa2bQ7wEDIg+ac+nyL3iD/xeva
	4leFBncoa2ZbDUrEUQ+Ox53GKKXpUqhVgNEp4S7vTVa+IDR94taDgv8Uxu3ad3wV
	CyihT9icGpnq9hYQR0bXNyGvsOS27X3I95Gsxx73tpwAB+OqhwsA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt5nhvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P4rdxI039375
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:14 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2054.outbound.protection.outlook.com [40.107.96.54])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr5knuu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7T/yEdFzNzdL5RqICPXfFU/iK9hYUCoagPkP1xhU2OZy++EUwPq0T3droVFf23sOpedKhO+kQ6lmFRZ04/UYejZwg7vWLbB+ZvrLSl9TN4u1JtTTrzAcQWPZp/LWCrWHBtkD9qxbSK3BJBVYOcs1XLC+o3xtX+vsYfh7RRb+bTDJTGwojH7dVHCqdR5cg/y4Itre/KCdSWEIQhUF8PMlSuLIjctBkmEYfEGWYMk5hGh7ztMqRDgH8DaTIyZJrZHR8mewc+kmueJlxZ75sAsqk+dQbNbsmZUEeuAVV4RG6XBxHNv+NrmUVwdJrKvBkchFQp5cjeIlGk6T/w0WL473Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QvKOfLkkXcn+P0rEDAeX6d86tJxiw202qcfVevdanA=;
 b=RusYow534ALm63sL6T1XWHOvvBAfR7WLSPcIz1eIjZWguYzdN2RpBy8bHvYcxQY5dQJbPW9Ydy9UjlHwe2V9fIaQN2A82hQiS8FaBGWLq87ZP07XST0qyRtp/hBhBkaQgbrtjt+ndImU7/FEEOh51y4uGyCqIhqRNEZOObJAEboNmqKx3KqqaGL0PJBTINKlkHNJEVU7Mg6Q4scdlvX+D9xdgjyM92EB5/fY9hR/aZbZrWqcX+UxOcHSaZTI2j7H/BMPEcZY33wMsn7raQKYwVcbCCX8PJWAU85fLAgKh7MODY3DT3Jg/3rgC75RJqb3tIXsJZb/GzSzGPV6lhHG/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QvKOfLkkXcn+P0rEDAeX6d86tJxiw202qcfVevdanA=;
 b=Ri6v82aRV8i1iYF7T92ni49oAUL+7nce2rOJ2Gc+84ULsDfz2R2eFMrMABz1zGK/+dqNw98lPhv4yjale0MVrGYU0hQZQ4dBvkKlyF1DqfiwKk6xI4C9Ia4Amo12sl1MR3RyqRlV9ToU6Q283AITP4BHP4YpEU4lZgWw14MQ8e4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN7PR10MB6476.namprd10.prod.outlook.com (2603:10b6:806:2a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 06:03:11 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 06:03:11 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 2/2] Extend the USDT bit mask to multiple words
Date: Wed, 25 Jun 2025 02:03:04 -0400
Message-Id: <20250625060305.15707-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250625060305.15707-1-eugene.loh@oracle.com>
References: <20250625060305.15707-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN7PR10MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 1846c4ab-3edb-4473-e77a-08ddb3adf74e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wc0EjwJAfU7Q2vCqee16a9X3vJFUCbt3Sb+yg+dELZHi+zbPB4stmlrX0ZXt?=
 =?us-ascii?Q?T9UOTkVAJfG9aI5WJu5PVs7IjsvEr4oK7hM4LFItQNOGYzktjs/Y3EaT6Bzc?=
 =?us-ascii?Q?jJ65zMytSrYdqxQo+eeRU6AUFw+mLf0hlD8aXqdmlwfOa7HmRx/gNWJ6+Ksx?=
 =?us-ascii?Q?oGaSGnCqatjF7Tvao7nfmLRqqZEtkZw6+mf9kAmISL7rxG1tQ6pEAeNrwj93?=
 =?us-ascii?Q?Tc1Q7hkr9v4Ui5Jl297k9xIaXzqzH/vnsMU1wT9aav6j1us8bUHDA5QMoi1q?=
 =?us-ascii?Q?y8VWe3lxYKngC8ipnhtra252z5WAUyJAV71xdOxVLV5iMs7EywHt1c2wtt4v?=
 =?us-ascii?Q?u6oMKrbJfJBSjR/OiF+2S7/PRGo57r4os6lt+qPkI+3FRIaI/vX90/ilXA27?=
 =?us-ascii?Q?+iD40TMQVaAPQ0SMjhX91zxIbrjv3lPrVdBNq3BWAUvKVINGMJjMPGqRE7X9?=
 =?us-ascii?Q?DttPk5qp7EymB+aFFpWjCcV3o6FyG7QFvD/1m9KBXFxNiivjia6u/yW6mOx/?=
 =?us-ascii?Q?hAEZFP0HGJWfEnuzKKhnn4wd3ukCJxEy6Gaizwe0YARvolX37O0CPRIixzWH?=
 =?us-ascii?Q?I4XBBSpN0nUju7F+04bg7RSysZnnKEimgEVaRUzTqwn/OPZB4GEENyvXCWmG?=
 =?us-ascii?Q?3x2l8qk9crVMcr6qm/T0S/ml2qi99H/H6cKZekAvLHB2HcVErTjThDJKdX6g?=
 =?us-ascii?Q?yBZQJT9v9tGEQHOaC0KsWogBqBGg3aUL/2PkmTd33sHQq4zBM2FnpN6YDI8U?=
 =?us-ascii?Q?4SqPbmLKvKdHTFlSWFqF+X055fqZqBF10rAQTFsAlI0iKCvNNmD+8m3RUpok?=
 =?us-ascii?Q?Z1snp/BZJ9XatZLudEzigK3xmw4mxRh7QhqPYaPsaEegv0VAL8GJ9o8IgtAy?=
 =?us-ascii?Q?YynKSYFgKZdMYNEU2Yp0YJX1A/cfN7BC0fTh1Yn1XChtWibxVf3A9fgGynWn?=
 =?us-ascii?Q?EC0dZ9ZdgEP89lqUGsg2SZS6tdDfBhXgyBr+4wjEYbIosESMdgde5j0IhWpW?=
 =?us-ascii?Q?J1O7xDC1AajfmczSqZ8EUPj4geKMFMZOWDsSRQjJr96aKExwRLSJUlEgaimO?=
 =?us-ascii?Q?YyTNnvoE9aekVfpKhNL1jP/WhCVmJ9PhmHAnjPg0BbkbMovhVPU8ieEorJq8?=
 =?us-ascii?Q?TztqOSwHb2PO16eRUzH8ZNJ4au0qKYbis48MbFp+lWXLSmnnY6ScV/Sjbc3m?=
 =?us-ascii?Q?3yw06ultzxw9wxsty51oV+6Im4TKFSycD/PuFrwK8ApTMQvyIw3NHtRyKigs?=
 =?us-ascii?Q?8AbHDz9e9W6zgBdfVjb9MTOMjXWraaR9ix7vl1r7HNu00/ongGTBvte3bnEY?=
 =?us-ascii?Q?XPuBuyR+TP+PUIsw23naW6vPiKlvOuuC6f535BXkjT+MZHxiizJSMJg7FU3G?=
 =?us-ascii?Q?v9nKe/V0hPinJwmdFk6qumNYoXEjh+I441R2X+zCsmwLWXVCUtclsEzaWZrt?=
 =?us-ascii?Q?vd2YN6dDnZ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TD8kASjrKDBZK1ijZvfp6vJYny1GibTPyF5SbRsAYbDJu/RQD+NHu2/kxkuK?=
 =?us-ascii?Q?lu1VoXRVbtG6zl8tSWEUsi1mSz6CSVXiLbTjKoQnRJ15FRcSJFXCWNr+6a+F?=
 =?us-ascii?Q?SGr6lXSRtglMin9ZzTNARFjSFFtjdyobHKLPxoKhTsrmkiczTOwcGyfF0sqr?=
 =?us-ascii?Q?ypqCYql0wAPg352z4PttA0tgB6idTPv8hwgo3oCCxaOkfeAikME1SdCnJtcN?=
 =?us-ascii?Q?3oPewANY67HqjAwcVE6gkOTWjTMhbucdv4x6VkuYUuKYx7ejNB9p6x8ZYnoB?=
 =?us-ascii?Q?aG0kdtDcGmyM9f6rKrM13LGG6rnqubF6iZ3e15NDEP12YOu/vI050TZf3HaY?=
 =?us-ascii?Q?NI7PDnLRndRX9Q7W9s6Hujkubt8fph5FbrGbBEMwQmGoTEaM98m/SW/wYdbt?=
 =?us-ascii?Q?kWtLjOt0ChvAFk+L3CTMUQJc7PW52cl1PtaKZCXoBgcks+Qdj72ACSxtuHvQ?=
 =?us-ascii?Q?CKRn/+fKeMdl7vd4/exu9ubpPnBPY8Xq0CTqbwuE8Kzf+9rPRIkU9cJR1rD6?=
 =?us-ascii?Q?K4d7etl1bkqFlXS/wgOu81uMARQYYZKkDYfhHGthHfq6g5KQDwCOiwbdLrfO?=
 =?us-ascii?Q?Mwe+9hGt8zBFJdx/mORgwPfVSrYAuTXfVP6c46SHVLYuhlO4qpMH9/68iGgW?=
 =?us-ascii?Q?JKpNXXuPePpbd0XVSjJXCTGa91Av1uDWxAIzkO8ZHEYCr49sWxzPeBkCFpaU?=
 =?us-ascii?Q?nyUKbdoQgwI9D1SqhyEXYDuEDE28bVcp5jHScoq3rHMolNmOQ18t221vtPBu?=
 =?us-ascii?Q?e9W926MEY0KhnreRNioQUrsbu4UdIM4XUzCJgc1Nx6+N4fTT8cGRtLXkPACm?=
 =?us-ascii?Q?6j9IwoV/PrdxVIPr47KyQNNhQeAO6Ye0L1eSMbx4MyGk1VCDU6EM8aL3eJJ3?=
 =?us-ascii?Q?/1vXptZr9vyxj7SbNbIHxITGhsCfibAabNkDKgk9a/OqtI4HaKYDH9BnKkX2?=
 =?us-ascii?Q?33Xdy7M03KfsPsK8QH8anylV4YmkRxqjhta5+4OvKin/zMXDVIALj4myyYb+?=
 =?us-ascii?Q?8GkVzCVF2tRFmU+DMouYca7Zwwmy3Y6Yn7ZtBUme/l2TXWFXQWhSQpV6FkHN?=
 =?us-ascii?Q?nEukeJ2lQMM5PZs6pJrOwtbukQcLbe06Etp3zpK0roeLeHSl4qxAVKAWhyj7?=
 =?us-ascii?Q?csbO9uCsyJvlM5XQrGfL0kF+QlTrt1YlXMb6NJZb06HPZ5siZ61IDkzVImJT?=
 =?us-ascii?Q?Nj5aIWEFc45Stu/7/Y1gXffdzhObq/HePXXYwJpikvSgJLNgmiqR9BTklUO4?=
 =?us-ascii?Q?8t2ZqODPV4QeWdc//KgSN4QmVKOsL9J4BJhHIj4+Qta6vkkb4Ynx66E6pMiJ?=
 =?us-ascii?Q?VSyVHO568NL4KxC73Kcz1YwIfsk6jWNntj2fdAdbK8x218sv5bf7IwD1q5IY?=
 =?us-ascii?Q?zhTgnFwtOWoi1x7zKMnjp/N+aXgHP6o19AxstogeztuuAKZ71+3v+IigFwJa?=
 =?us-ascii?Q?UgHfYI/qSpP5ITPjQYpBlqzu2BBQSEw/Gy8924oZM7uDr8Ecg1olU+nQTh4T?=
 =?us-ascii?Q?/UXB5r7lQF039gxi8zsH8bd8GbWqjqvQDCfU8yHwow0ofyn3VZLfLerXW3zD?=
 =?us-ascii?Q?UQkZbe2etE6XXBjQJxO1bfBmBnAmPfUzgmts9bNg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7EPITmgrXyNnREzRJ/CzW433nQamh0JbauR/KjgfgInUrF3Phn4R6P3j8Rjv0Vo0yYjVT1w+hvAm9lIafWLL8sHS9tC1cAvFsdllrEfao0/j6gisy4rlBpX4HatIAufXbvRiAriXby2XF6M3agWD1WkIcncZd4C+VawUbl5cR/5FLCAWvE/68DvgmwBumjX+sq3tTEEqPzYSzugUXZr9pXLOZHa9CqwbUCc/U6C81LNgOS3ivti5ReIcwssm0zGsuEoMWjqnvS7/7dmTrVHszfPUoqp8IpGGFIG83JUxb89nfhjl0CbWPNKBPjsRs+fPvyoJ+J68RPSs65qF1cB2fDaBdQYuFA+LVv22FOOp3eIWNyeHtAsS++GUlv6sPrWh9GkBOtuxU0PCUvr4jCcN4CqAZf2I4xqqLur1vkth5wTGOifNMKDU09VJFVthjmW3C287qsClgblCI+ZqvjRuHee0srBDSjcLm77zH1gET7WEiqzIw/rvj86HDh+fSIsK4ORe+8+iM0hnCaPiRVDnbvcTH/IAPKtkzGk7XcOBtwyAnx6XKXYIoyMDfZu6PNhN+Z9s+eTZZTvUfK8Dnr/6Lwec5q/aw5uxjQOaMD65rjs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1846c4ab-3edb-4473-e77a-08ddb3adf74e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 06:03:11.8296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrUgDHv4vT+rpSDanQOuIZjhzf4T660BMj5ZshcX9W0DJQuo98Y7T6+6cfczwqe3+jHN1NLzBAutI05UuAnAEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6476
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250044
X-Proofpoint-GUID: nS-LyoGTJvFB-3pK4vuAci0TOplQ_2qx
X-Authority-Analysis: v=2.4 cv=PMYP+eqC c=1 sm=1 tr=0 ts=685b9123 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=j9KYSMBpoFUMXAvDsEsA:9 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA0NCBTYWx0ZWRfXyoZbH1YqCe/3 NrYKoe+q7Qyvv6c0TWO/Gn+/Plzo0pRbBTOehLnKW9HFortYcs3R80syda7qabZm6dawuRRCYm0 dvKf0tARwx+7Kexohj1wFdFOGQkqPzqAIWjYXB+e3C47If51H8haMgK+tQTZctkkQ5apDc6pq72
 DFP9dtl2vUymb3M6Yn3nRmOaLOfG7nnPUTKTvAgGWEzYddfrKURBxJ8xlcDMXWLH/9z4NdBkb+f wRf03NTwh3vlDuWL/Ip/i/FQPcQ4Ju2zDtbaW0zEmTt/K9WqAEoW/GIjt0MkR8jYb+SLEaeIfCD eOuW8YZRRMzNr1hy+XjEJ3M8yLyICCF0Gu7n2uJQ9Jn9lx0N3Cz2Bf14PAQ9wIbzyEwawih/1m8
 Io/2xXe2mnqaeKzNsZrKl4kP+lTzd9sgN3iLREK0pIt2sgNXJJs7I/AiPjgnUp+hQ+YMxknA
X-Proofpoint-ORIG-GUID: nS-LyoGTJvFB-3pK4vuAci0TOplQ_2qx

From: Eugene Loh <eugene.loh@oracle.com>

Currently, USDT is limited to 64 probe descriptions since the
underlying probe uses a 64-bit mask to decide which probes to execute.

Change to a multi-word bit mask that can be extended to however many
probe descriptions there are.

Also, change the mask words to be 32-bit rather than 64-bit.  The reason
is that, commonly, there will be fewer than 32 probe descriptions.  In
this case, we shorten the value of the "USDT prids" BPF map from 16 bytes
        uint32_t        prid;
        long long       mask[1];
down to 8 bytes
        uint32_t        prid;
        uint32_t        mask[1];
(The second member is smaller and no longer costs extra padding.)

We also add an
        extern int usdt_prids_map_val_extra_bytes;
to denote how many extra bytes will be needed for the extended mask.
This value is computed by usdt_prids_map_val_extra_bytes_init().
Currently, this function is awkwardly called in gmap_create_usdt(),
just before the value is needed.  Such a call to a provider-specific
function is clumsy, but there are no other calls to the provider
between compilation (where the number of statements is determined)
and this map creation.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c                            |   6 +-
 libdtrace/dt_bpf_maps.h                       |   5 +-
 libdtrace/dt_prov_uprobe.c                    |  81 ++++++++---
 .../unittest/usdt/tst.manyprobedescriptions.r |   1 +
 .../usdt/tst.manyprobedescriptions.sh         |  64 +++++++++
 .../usdt/tst.manyprobedescriptions2.r         |   1 +
 .../usdt/tst.manyprobedescriptions2.sh        | 127 ++++++++++++++++++
 7 files changed, 261 insertions(+), 24 deletions(-)
 create mode 100644 test/unittest/usdt/tst.manyprobedescriptions.r
 create mode 100755 test/unittest/usdt/tst.manyprobedescriptions.sh
 create mode 100644 test/unittest/usdt/tst.manyprobedescriptions2.r
 create mode 100755 test/unittest/usdt/tst.manyprobedescriptions2.sh

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index ddd849d0b..029d5fcdb 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -967,6 +967,7 @@ gmap_create_probes(dtrace_hdl_t *dtp)
 	return 0;
 }
 
+void usdt_prids_map_val_extra_bytes_init(dtrace_hdl_t *dtp);
 /*
  * Create the 'usdt_names' and 'usdt_prids' BPF maps.
  *
@@ -992,8 +993,11 @@ gmap_create_usdt(dtrace_hdl_t *dtp)
 	if (dtp->dt_usdt_namesmap_fd == -1)
 		return -1;
 
+	usdt_prids_map_val_extra_bytes_init(dtp);
+
 	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
-	    sizeof(usdt_prids_map_key_t), sizeof(usdt_prids_map_val_t), nusdtprobes);
+	    sizeof(usdt_prids_map_key_t),
+	    sizeof(usdt_prids_map_val_t) + usdt_prids_map_val_extra_bytes, nusdtprobes);
 	if (dtp->dt_usdt_pridsmap_fd == -1)
 		return -1;
 
diff --git a/libdtrace/dt_bpf_maps.h b/libdtrace/dt_bpf_maps.h
index 884dc3983..bdb20c9f2 100644
--- a/libdtrace/dt_bpf_maps.h
+++ b/libdtrace/dt_bpf_maps.h
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2019, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2019, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -48,8 +48,9 @@ typedef struct usdt_prids_map_key {
 } usdt_prids_map_key_t;
 typedef struct usdt_prids_map_val {
 	uint32_t	prid;		/* should be dtrace_id_t, sys/dtrace_types.h */
-	long long	mask;
+	uint32_t	mask[1];
 } usdt_prids_map_val_t;
+extern int usdt_prids_map_val_extra_bytes;
 
 #ifdef  __cplusplus
 }
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 5ba50b678..65413cba6 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -303,6 +303,8 @@ typedef struct list_key {
 	usdt_prids_map_key_t	key;
 } list_key_t;
 
+int usdt_prids_map_val_extra_bytes;
+
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
@@ -403,7 +405,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 	int			fdprids = dtp->dt_usdt_pridsmap_fd;
 	int			fdnames = dtp->dt_usdt_namesmap_fd;
 	usdt_prids_map_key_t	key, nxt;
-	usdt_prids_map_val_t	val;
+	usdt_prids_map_val_t	*val = alloca(sizeof(usdt_prids_map_val_t) + usdt_prids_map_val_extra_bytes);
 	list_key_t		keys_to_delete, *elem, *elem_next;
 	dt_probe_t		*prp, *prp_next;
 
@@ -418,7 +420,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 	while (dt_bpf_map_next_key(fdprids, &key, &nxt) == 0) {
 		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
 
-		if (dt_bpf_map_lookup(fdprids, &key, &val) == -1)
+		if (dt_bpf_map_lookup(fdprids, &key, val) == -1)
 			return dt_set_errno(dtp, EDT_BPF);
 
 		/* Check if the process is still running. */
@@ -431,7 +433,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 			 * we might delete the same usdt_names entry
 			 * multiple times.  That's okay.
 			 */
-			dt_bpf_map_delete(fdnames, &val.prid);
+			dt_bpf_map_delete(fdnames, &val->prid);
 
 			/*
 			 * Delete the usdt_prids entry.
@@ -452,7 +454,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 		 * FIXME.  There might be another case, where the process
 		 * is still running, but some of its USDT probes are gone?
 		 * So maybe we have to check for the existence of one of
-		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
+		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val->prid]->desc;
 		 *     char *prv = ...pdp->prv minus the numerial part;
 		 *
 		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
@@ -589,6 +591,33 @@ static void usdt_error(dt_pcb_t *pcb, const char *fmt, ...)
 	longjmp(pcb->pcb_jmpbuf, EDT_COMPILER);
 }
 
+void usdt_prids_map_val_extra_bytes_init(dtrace_hdl_t *dtp) {
+	int i, n = 0, w = sizeof(((usdt_prids_map_val_t *)0)->mask[0]);
+
+	/* Count how many statements cannot be ignored, regardless of uprp. */
+	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
+		dtrace_stmtdesc_t *stp;
+
+		stp = dtp->dt_stmts[i];
+		if (stp == NULL || ignore_clause(dtp, i, NULL))
+			continue;
+
+		n++;
+	}
+
+	/* Determine how many bytes are needed for this many bits. */
+	n = (n + CHAR_BIT - 1) / CHAR_BIT;
+
+	/* Determine how many words are needed for this many bytes. */
+	n = (n + w - 1) / w;
+
+	/* Determine how many extra bytes are needed. */
+	if (n > 1)
+		usdt_prids_map_val_extra_bytes = (n - 1) * w;
+	else
+		usdt_prids_map_val_extra_bytes = 0;
+}
+
 static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
 {
 	dtrace_difo_t   *dp;
@@ -650,6 +679,7 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	int				fd = dtp->dt_usdt_namesmap_fd;
 	pid_t				pid;
 	list_probe_t			*pup;
+	usdt_prids_map_val_t		*val;
 
 	/* Add probe name elements to usdt_names map. */
 	p = probnam;
@@ -685,11 +715,11 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	}
 
 	/* Add prid and bit mask to usdt_prids map. */
+	val = alloca(sizeof(usdt_prids_map_val_t) + usdt_prids_map_val_extra_bytes);
 	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
 		dt_probe_t		*uprp = pup->probe;
-		long long		mask = 0, bit = 1;
+		uint32_t		iword = 0, mask = 0, bit = 1;
 		usdt_prids_map_key_t	key;
-		usdt_prids_map_val_t	val;
 		dt_uprobe_t		*upp = uprp->prv_data;
 
 		/*
@@ -707,11 +737,15 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 				dtrace_stmtdesc_t *stp;
 
 				stp = dtp->dt_stmts[n];
-				if (stp == NULL)
+				if (stp == NULL || ignore_clause(dtp, n, uprp))
 					continue;
 
-				if (ignore_clause(dtp, n, uprp))
-					continue;
+				if (bit == 0) {
+					val->mask[iword] = mask;
+					mask = 0;
+					iword++;
+					bit = 1;
+				}
 
 				if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
 				    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
@@ -726,11 +760,11 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 		key.pid = pid;
 		key.uprid = uprp->desc->id;
 
-		val.prid = prp->desc->id;
-		val.mask = mask;
+		val->prid = prp->desc->id;
+		val->mask[iword] = mask;
 
 		// FIXME Check return value, but how should errors be handled?
-		dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
+		dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, val);
 	}
 
 	return 0;
@@ -1451,7 +1485,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	const list_probe_t	*pop;
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
 	dt_ident_t		*usdt_prids = dt_dlib_get_map(dtp, "usdt_prids");
-	int			n;
+	int			n, ibit, w = CHAR_BIT * sizeof(((usdt_prids_map_val_t *)0)->mask[0]);
 
 	assert(usdt_prids != NULL);
 
@@ -1538,7 +1572,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 */
 	assert(sizeof(usdt_prids_map_key_t) <= DT_STK_SLOT_SZ);
 	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
-	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + (int)sizeof(pid_t), uprp->desc->id));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP,
+		   DT_TRAMP_SP_SLOT(0) + (int)sizeof(pid_t), uprp->desc->id));
 	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
 	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
 	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
@@ -1572,8 +1607,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
 	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
 
-	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
-	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask)));
+	/* Store the value key for reuse. */
+	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
 
 	/*
 	 * Apply arg mappings, if needed.
@@ -1587,21 +1622,24 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	/*
 	 * Hold the bit mask in %r6 between clause calls.
 	 */
-	for (n = 0; n < dtp->dt_stmt_nextid; n++) {
+	for (ibit = n = 0; n < dtp->dt_stmt_nextid; n++) {
 		dtrace_stmtdesc_t *stp;
 		dt_ident_t	*idp;
 		uint_t		lbl_next;
 
 		stp = dtp->dt_stmts[n];
-		if (stp == NULL)
-			continue;
-
-		if (ignore_clause(dtp, n, uprp))
+		if (stp == NULL || ignore_clause(dtp, n, uprp))
 			continue;
 
 		idp = stp->dtsd_clause;
 		lbl_next = dt_irlist_label(dlp);
 
+		/* Load the next word of the bit mask into %r6. */
+		if (ibit % w == 0) {
+			emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
+			emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask[ibit / w])));
+		}
+
 		/* If the lowest %r6 bit is 0, skip over this clause. */
 		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
 		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_1, 1));
@@ -1629,6 +1667,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 
 		/* Right-shift %r6. */
 		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_6, 1));
+		ibit++;
 	}
 
 out:
diff --git a/test/unittest/usdt/tst.manyprobedescriptions.r b/test/unittest/usdt/tst.manyprobedescriptions.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/usdt/tst.manyprobedescriptions.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/usdt/tst.manyprobedescriptions.sh b/test/unittest/usdt/tst.manyprobedescriptions.sh
new file mode 100755
index 000000000..92a61d5b7
--- /dev/null
+++ b/test/unittest/usdt/tst.manyprobedescriptions.sh
@@ -0,0 +1,64 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+dtrace=$1
+TRIGGER=$PWD/test/triggers/usdt-tst-args
+
+DIRNAME="$tmpdir/usdt-many_probe_descriptions.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Construct the D scripts and output files.
+# We stick 80 probe descriptions in each of 3 scripts to test
+# USDT's ability to handle hundreds of probe descriptions.
+for d in 0 1 2; do
+for x in 00 01 02 03 04 05 06 07 08 09 \
+         10 11 12 13 14 15 16 17 18 19 \
+         20 21 22 23 24 25 26 27 28 29 \
+         30 31 32 33 34 35 36 37 38 39 \
+         40 41 42 43 44 45 46 47 48 49 \
+         50 51 52 53 54 55 56 57 58 59 \
+         60 61 62 63 64 65 66 67 68 69 \
+         70 71 72 73 74 75 76 77 78 79 \
+; do
+	echo 'test_prov$target:::place { printf("'$d$x'\n"); }' >> D$d.d
+	echo $d$x >> expect.txt
+done
+done
+echo 'test_prov$target:::place { exit(0); }' >> D$d.d
+echo >> expect.txt
+
+# Run DTrace.
+
+$dtrace $dt_flags -c $TRIGGER -q -s D0.d -s D1.d -s D2.d >& actual.txt
+if [ $? -eq 0 ]; then
+	if diff -q expect.txt actual.txt > /dev/null; then
+		echo success
+		exit 0
+	else
+		echo ERROR: did not get expected results
+		echo === expect.txt
+		cat      expect.txt
+		echo === actual.txt
+		cat      actual.txt
+		echo === diff
+		diff expect.txt actual.txt
+	fi
+else
+	echo ERROR: dtrace error
+	echo ==== output
+	cat actual.txt
+fi
+
+echo ==== script D0.d
+cat D0.d
+echo ==== script D1.d
+cat D1.d
+echo ==== script D2.d
+cat D2.d
+
+exit 1
diff --git a/test/unittest/usdt/tst.manyprobedescriptions2.r b/test/unittest/usdt/tst.manyprobedescriptions2.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/usdt/tst.manyprobedescriptions2.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/usdt/tst.manyprobedescriptions2.sh b/test/unittest/usdt/tst.manyprobedescriptions2.sh
new file mode 100755
index 000000000..8001cec0b
--- /dev/null
+++ b/test/unittest/usdt/tst.manyprobedescriptions2.sh
@@ -0,0 +1,127 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test uses many probes and probe descriptions.  Therefore, the
+# number of BPF programs to load into the kernel -- dt_bpf_load_prog()
+# calling prp->prov->impl->load_prog(), which is dt_bpf_prog_load() --
+# and the duration of each load are both increasing.
+# @@timeout: 400
+
+dtrace=$1
+
+DIRNAME="$tmpdir/usdt-many_probe_descriptions2.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Set the lists.
+# - The probes will be foo$x$y.
+# - The probe descriptions will be foo$x* and foo*$y, for each $d.
+# So if there are nx items in xlist, ny in ylist, and nd in dlist,
+# - there will be roughly nx*ny probes
+# - there will be roughly (nx+ny)*nd probe descriptions
+
+xlist="a b c d e f g h i j k l m"
+ylist="n o p q r s t u v w x y z"
+dlist="0 1 2 3 4 5 6 7 8"
+
+# Make the trigger:  Preambles.
+
+echo "provider testprov {" > prov.d
+
+echo '#include "prov.h"' > main.c
+echo 'int main(int argc, char **argv) {' >> main.c
+
+# Make the trigger:  Loop over the probes.
+
+for x in $xlist; do
+for y in $ylist; do
+    echo "probe foo$x$y();" >> prov.d
+    echo "TESTPROV_FOO$x$y();" | awk '{ print(toupper($1)) }' >> main.c
+done
+done
+
+# Make the trigger:  Epilogues.
+
+echo "};" >> prov.d
+echo "return 0; }" >> main.c
+
+# Build the trigger.
+
+$dtrace $dt_flags -h -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to generate header file" >&2
+	cat prov.d
+	exit 1
+fi
+$CC $test_cppflags -c main.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test" >&2
+	cat main.c
+	exit 1
+fi
+$dtrace $dt_flags -G -64 -s prov.d main.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >&2
+	exit 1
+fi
+$CC $test_ldflags -o main main.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >&2
+	exit 1
+fi
+
+# Prepare the D script, generating the probe descriptions.
+
+rm -f D.d
+for d in $dlist; do
+	for x in $xlist; do
+		echo 'testprov$target:::foo'$x'* { printf("'$d' '$x'* %s\n", probename) }' >> D.d
+	done
+	for y in $ylist; do
+		echo 'testprov$target:::foo*'$y' { printf("'$d' *'$y' %s\n", probename) }' >> D.d
+	done
+done
+
+# Prepare the expected output.
+
+for x in $xlist; do
+for y in $ylist; do
+for d in $dlist; do
+	echo $d $x'*' foo$x$y >> expect.txt
+	echo $d '*'$y foo$x$y >> expect.txt
+done
+done
+done
+echo >> expect.txt
+
+# Run DTrace.
+
+$dtrace $dt_flags -c ./main -qs D.d >& actual.txt
+if [ $? -ne 0 ]; then
+	echo ERROR: dtrace error
+	echo "==== D script"
+	cat D.d
+	echo "==== output"
+	cat actual.txt
+	exit 1
+fi
+
+# Check results.
+
+if diff -q expect.txt actual.txt; then
+	echo success
+	exit 0
+else
+	echo ERROR: unexpected results
+	echo "==== expect"
+	cat expect.txt
+	echo "==== actual"
+	cat actual.txt
+	echo "==== diff"
+	diff expect.txt actual.txt
+	exit 1
+fi
-- 
2.43.5

