Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3F527815D
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768600938; cv=fail; b=Kitmq/7apCQTJA9Y1MkP1inpqDsdDuicE0whHc043u8feB/CmeqoqbqdxuIQKUjWiOhS6U4C4zuggFaeE0aWj2eeIEPurkvpQDSDioDOfRbXAPuOX0QOciBtfFh5XA2oXCbHZeGz7LVq7AJV6vEN6zho7ar3JmHqgblj5OTHPoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768600938; c=relaxed/simple;
	bh=pSgiAjJde3+xxsGHKlyvDjGrxGEEPFWjO6BXt5VKoX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YbIqdfnwA7t3t4/+cHFVtyR4CTSDrtQywG6GUmoni1GoWzO78WrFWJ1TDyK7mTxr2fulpuvXI+D7sqF9M0AmPWk9aarH9UwWtcYrDsBAxwwI21PC+nwdg9uqH1YxKPqxrGNtx00iquB1dyErIsnmKTpkW6VuWRDjC+QTkYzfsTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gWIsrIhk; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XmvT2n2r reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gWIsrIhk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XmvT2n2r"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKbOX54013343
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=WqB10m1/DWge+A992ZK+BHjeNyKd0d9w+5TD9u9PAJ0=; b=
	gWIsrIhkUJDj6HvvFMzNv5uXiDpNK+kG4m2p5NEPGhuDjfZDpVPHke/K8qACJ2ts
	UUY0qdj1OPZVjQhLaXP7iNQjbOVJw258UZX9y4+5M25zFUaa1T231viDRmarRVuO
	8hyQ20N8uxn1eygIF/cGHinU7UtYuQciE4OJmYeCrEDZaTOtxpjYPVbf1nHaJcU4
	15Y0uv3r2ZKTedhfqs0MMH0l+4UqEOefzVyxj4lbMU6OQ3g29JKsO1wjfFxe9wkG
	A1IC2itsH0xp7Ijx5J458FgNU+Rf6SPbuupGaqp+03CGgMNNl7hMFj5mCL6ITJYX
	/1BXHUY9QlJzvQ17KZ2Xjw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bqvhe832x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:02:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GKujhO036152
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:02:15 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011057.outbound.protection.outlook.com [52.101.52.57])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bqvtj9w2m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:02:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCSh4YiWZaawsG2Dd7jzob3iYXiCbWXnE4Ie8itKeq+F5nIIUkuucTu1DNKt+0NLp8XLhznOq+f7leM24irTZsiyB+hNea3N/LiYtq6aPIQU30m8HC3hWwf7kZnvGwsJFUWhEm1/njPiWuxkq1zPokKgLfyJcKZ0jUYNCCs2z5rwmGJAPqmg1KSNKxQPgriBNYx7JxkZd9aqkqHw52Yd20wbRM00CEBZOnX4cMxi6sFoUgAMrkg04FQr6uFbTVVH5ihRsKIrBQAdsu3o9HKWDAo7/COHKzhunbN9QjVq10dELqMRJofMl7mYiR5rChoZY63SauyQMJW5x4Ho7M7+Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghP+l5OOekeYvC1u6QUcLvISKhpTFWbDU3oZAoJX+lE=;
 b=cPizFEvu0cifogmF/cKtyuA7lIlH35QkrMaarQnfwT0TplG6oXQ5xj5vOlsHOHeTsRRNPFUIi1dKQRWZZ2UNjz/fusyHcdrNwSEEb5c64bXIdNpKfsnc0wGxoqpdNS+cKRcXHtCVe1RaXThrVCRU7YLzK18E0GkQh6ooTrlOBCJ21zJHkiJvyirYXxYwhhAYzdUhgsybrl0w9gZ7CB1vihJ085v+IJprbdDkJ9xtwfxd35XsDBR7PDPVUXZe3gUUBWpktqF8JxP5bwpOBETYU5TepgBFlHZoLmP+SARtchSBaBS4Mn+/ZGEchgy8K0EI5NILKk/R1mAIgE7HxpIsgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghP+l5OOekeYvC1u6QUcLvISKhpTFWbDU3oZAoJX+lE=;
 b=XmvT2n2rZsimfW7v6oCZFCAaTkiTRY60z3J/vlB7lEKXtrTRfuPPup7uB8lYUMBXfZ5xRqb48+C/pUMW3RC3/EqSGoJCqa1saxuOMsO4y+wYXZwtxhxkEkBV4B0HgO11xV6yObT3P4FRjDPMIxHzMdkBrBjKHsk6egA9NxKYFj4=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CY8PR10MB7267.namprd10.prod.outlook.com (2603:10b6:930:6c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.7; Fri, 16 Jan
 2026 22:02:12 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 22:02:11 +0000
Date: Fri, 16 Jan 2026 17:02:09 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/2] rawfbt: prvname is not properly set
Message-ID: <aWq1YWvbTGl7nJni@kvh-deb-bpf.us.oracle.com>
References: <20260113214205.9159-1-eugene.loh@oracle.com>
 <20260113214205.9159-2-eugene.loh@oracle.com>
 <aWlnowR5WC8zzdd+@oracle.com>
 <cfc4a3c2-b2b3-b912-f53b-1a995388db11@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfc4a3c2-b2b3-b912-f53b-1a995388db11@oracle.com>
X-ClientProxiedBy: PH8P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::14) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CY8PR10MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1a7c86-bb33-4b0d-d45a-08de554ae686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?5yokz8QHjm+gQG5BCX4j6SiRzJ7eV2npj5L1X+FF/oMza9XtdjDnq7vjCs?=
 =?iso-8859-1?Q?++XGoavOkWPdJT9z2ChxdW0Jm+eLPvi7n9JP3sQjdr3B/hMhD2iZ/abd2+?=
 =?iso-8859-1?Q?dbzItHJFcpFhPCZs0O6eqx9sHrz2ch50q8Gofgg+wlUOfVT63t0vl5u7Np?=
 =?iso-8859-1?Q?5u/+sIdC4fBmynaQrpIMe8YILRqQnUsGtpQNmt9XHykJtx80qrsCC2nJ96?=
 =?iso-8859-1?Q?mEyfuzT88fpoaCVff5rWlfImQKoY8dKfUd/eUXIsbbGOlUB5Dt4hVSvrrt?=
 =?iso-8859-1?Q?Cmj1aN2u/1zT9OdemuseWGMCaPBlP2PrVyyDB+BDZisARwl8X+DicsZVg2?=
 =?iso-8859-1?Q?/C7cIWjkn+zFCg++jNy6sgG9dhOSQB9m8De2lyWCKT6jkbSXKKsksVoyAI?=
 =?iso-8859-1?Q?tt1JbNLi8v8B5nbp7ch2hzDTpc9W7B6aXSStHmI1tY9NMQ/21c6hsaXNyD?=
 =?iso-8859-1?Q?Q8a/1TXBpUlgnnyFuPT13DH3iycE1ZJGbHhWlxqNBfb54xNaGB86JS725Q?=
 =?iso-8859-1?Q?SMigBYsuSn96KcsG0h9K4rbWVciXX3tUa04nTRAcJFJJNGUm0QUmH6sQt/?=
 =?iso-8859-1?Q?9uA/SqrWJLWnh8MeF92YJZoDFZ9d6wLLnd2sd14vap0slPAf9jjBvhWQZo?=
 =?iso-8859-1?Q?809GJawgHpxZxDoSV0ku4tnhLe4yhNzvS5RQ+Pi2Gfoppcbs+UdjBMjFK0?=
 =?iso-8859-1?Q?tBpGLp3imztdFxH4a2NXxB+NDebiNnxstvtIpog4/QI7Qw/tevjh6ohLrh?=
 =?iso-8859-1?Q?qu/KHrsBI5ZR5sbxR7xHZtYtpEIw44Cg96CSpkDwr1du8F/7aPRYCrhMFp?=
 =?iso-8859-1?Q?pwt6MDVzoYucShIOtmo3yIIbudkVGtjv0qC2tWzXpBDg8KYn5/+1UMIXns?=
 =?iso-8859-1?Q?5RfelXle1cyeLdzy4evn9M8qUV8Mw93MLevOm6yxCaYbe2onngVBOe9sjB?=
 =?iso-8859-1?Q?XWROIIO3d60xC8XFjZQco0kZ56CwSdOrovlqHvoGe/am0jeqq/nFwpuMV3?=
 =?iso-8859-1?Q?1SOLjPMhLO6YiP9HxvkY4oGWr/7IPwCyGBYVU50Ek8JZzPNckPFFD0yvS0?=
 =?iso-8859-1?Q?0HyxFYZpS/1x9obasAV5Ypg/maC79qQmFF1wF+jgxjMmLG+xvxBfPrOWkH?=
 =?iso-8859-1?Q?nYvvhvdqw2kF7MjPaiCmW2EPkjFAsKMU5TpDCU4Lqbo7H+FXXDazIg/vn/?=
 =?iso-8859-1?Q?32QnOXBtje1iFIOCDdcwKh/OcVcborqoLjLkJVGJWcTjkUqMfRrOn+LnFu?=
 =?iso-8859-1?Q?i7OfNtDiUPrQp7PRHdt2sDfTkVFofQ6Tu/+mknlnq+HR0Pwnk1Fd3++A1J?=
 =?iso-8859-1?Q?Lr8EZVq401kgYuFw/4yDe2Rlhxux68+2DRjMN7PWxp8RlS2eiDJ8BkuOdW?=
 =?iso-8859-1?Q?jb0n54znTeEo5s6VXzi/0GR3cpRrQJDxf0KlloidtDnycgBN9SPt4q/SNo?=
 =?iso-8859-1?Q?cEORVgkgmjF85d9+oF3kmz3dZz/7ba3bPH7XoHsozisysEgIo3A/sM1gXP?=
 =?iso-8859-1?Q?l09L9/I8esen0nDFK3a6E5v9rwp0Xo8e7pXTPPefkm+M0Qt9LivnhNBmBD?=
 =?iso-8859-1?Q?NNky3xmKAD1YUgxolamAavCmMkdgMkqwMgDYH9j2aoAFBSxLxTDAzBBE2L?=
 =?iso-8859-1?Q?HUcXiEiLMVbQ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Rs+RmkRYQP7npEo63Mtgt/vuyuBIfkvLQ8UphvVEe/o0llUg09V0ysd/mn?=
 =?iso-8859-1?Q?9Kb5WCpYQjVo3kl4DGsiHYA9wdeJEYb0BLsF+zVr9FqP7bJ1ewhwMvNUKh?=
 =?iso-8859-1?Q?48x6cEV7uD1mcoGTC2LA3TTVocRnQBfb9Cul8bdwgNO7VbaL8dj5ymMNsp?=
 =?iso-8859-1?Q?IJMi9nMSeK1qy0rJDqb6RBfgiQ3ZhO7gaWA8OrjdB/5SfYk0qxkXqVUSFa?=
 =?iso-8859-1?Q?o8uVjsEvO1aUkj318iK2/SyQvF+nt1yJoBA873ngXw9gzRN9oqWIS3oYAV?=
 =?iso-8859-1?Q?nljKF6gcHI5S21xPhyC2YTVw92cei6o8FSykHg0ZtV67WshG45C7nZpFm+?=
 =?iso-8859-1?Q?7Hxg/FSocFR1cSLTkOmmTNd4L3AeI7b9Ne04Lw3LHl0vWZtmUPZ0xJWCn4?=
 =?iso-8859-1?Q?cDFyt5wK8uU+VyjyeuxT91ysmrr+vRsExUbI1VJM3XYZSe7zxBt3h46cBN?=
 =?iso-8859-1?Q?6EdkCsrZnerxC+Kv6lZqfhOl6hiCpA/Msw/jIFRDU68u5cCeFkqVm4woQ0?=
 =?iso-8859-1?Q?qPLqwrxx3OTPeMW8PVk+S82ltt04jg66lZBqAmrEQClZtJdqp3eCU19gZE?=
 =?iso-8859-1?Q?0gJNSeIXTjzJPmySgAYwMAYVk+1EcT4+mv+yCRyd0kjLkIH56uwYVESzHU?=
 =?iso-8859-1?Q?x25uTGQqi5kq//Oo1QcuqZ2Q+XgfNb3pRSHj69w87RByVUKO7dXK3NJKvh?=
 =?iso-8859-1?Q?wHlorQacoI5MkZ/OV89cZjrN7vu8Hiwaaxhs4CkzVnKmsraHO/uhoCidlh?=
 =?iso-8859-1?Q?wzWnnoWYDyRsvLUlSqLXifQCly5GMFugfr02DufumC97Dpc9ex9oGpQpyg?=
 =?iso-8859-1?Q?qzBpZKOvz3GB9BgfYBwgHPAJ/PoIQWFUk4QJDb803eHYDYAN/DEWhmaqsK?=
 =?iso-8859-1?Q?m6lFTB6xRZIhJaHeHCN7p8oR64lbboVDj99kQH3wvpGLf0ICoFggxJ0g0W?=
 =?iso-8859-1?Q?7faQJGhmIg0OW7vBJQr+fx+nY4hjPNGAQU+LalGREc+K4zlvpOJhiT1cy9?=
 =?iso-8859-1?Q?gQKaGcB+POe9IbRAlsBphpc2tN/xQcKuzDRoq1yIr1VtkiCthf+C53q8ww?=
 =?iso-8859-1?Q?4wrSChx/jvG1Zl8VNNudNVc6XKKG5KGlQYpMQqzXpz1wTpIwjdkw0FWd4w?=
 =?iso-8859-1?Q?jDRhrJ+PtVSAiiJRUdCE2A4nDLe5q1SktiR7zl+GboRIXh5if41GgPtWwT?=
 =?iso-8859-1?Q?hIYdsdqPJkijL7Ejus8k9duooSki4ke5IPIqVD2ZMxvbQilWYgSP6rzHV8?=
 =?iso-8859-1?Q?koGq5hA3+DlESzaunuie4AnescDQdCAw8i3nAfl+EmxFsFg9ZyWIdejUJy?=
 =?iso-8859-1?Q?ZUB3HZvmweX9MMSpQL61aeAnZm6zloiU05Mqp8NBTvo3Obu+h+TThbahf0?=
 =?iso-8859-1?Q?945/AE/F+S6BH3ZMM+piIoPnwCqoS8s/WceNVwp3pDiCnTkGynf+0/TMqg?=
 =?iso-8859-1?Q?0LeuCnC0zo57Go5yImVfmCDjSjXVbVzEj41YcusBhu6EqTsWjib1iBZBJz?=
 =?iso-8859-1?Q?wf4N0c6i2TGP72K9L6wjUdEXZAvMoy+w1Q/yIoislqMtXhHPuGy5gafUdr?=
 =?iso-8859-1?Q?yLkQbVQnAY1tuEufuOMXrtQCtIJyCo7ehZ+w5TQxAd6GWT+9MWTK1u0i6A?=
 =?iso-8859-1?Q?t4+2BnQiXjQIcYCUFAfO34HX+kbVsBzPgydyUFvL2e7al4af20t29t5wou?=
 =?iso-8859-1?Q?EfMziVN+U8bYqcT7eRuuWy5zwbMqPHfxf9VIpQ914FCxeSj/3OlxUCoelX?=
 =?iso-8859-1?Q?3heFfxYTkcKUhK6l7W9lrkdQWt2hiNtztQEgdRLkg2IepjbnrILc1VuNKV?=
 =?iso-8859-1?Q?QrPEX5ZxNAlwX1FK2nfsKPwF6e+loSw=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VfK8qJqB9Klj/V1w1ov1uDY3YDEITYrtYWYSFuaX8gx1Nm8nLO/MxtYQt6PudBAHEPTzpbaSiWOuAVxUXktIueE+FdCCezHKLl8jOw0p4yg8rnb7GuksALktZcmIsYacI0p6GeAFVi+jRSSAcGt3dLo5CFyIdY/BZrXC6s/Bgni+olMk3rs3wPkrGeCRIYoblNNF6Wsm6pu/DBqcqHFfl7GYGlvGlnlQr640MlD6hZ2OPtjmfU/9zqKcIrC8jNcEmVYkSxuFxT/ixTE3Qr3LYgdFAmgi9aUFjfzN9kFQcvuaDcEVu6s4s6X36J3sfpOR8IkUbdMgmNtOp4O1aT2cc3a0KiVlhTVLiNli00nhsE/6K/N+bxj3H/Pkcw8+FBk1hHphc5zRN4wnm7x7gIy1xLo0batnKtgr99ulMmVIo6nQFEK9lXstdH47ZDgBfsqVFbM3n9N7/8UJTlBhSlizxvmlmH8kPnwLaqbH7GGNedoHdh3NnRn6wRewUDEv6Sxp5rBMyLWSBfi6EUPJzW2gxIZHlUGBnpuhknNKUm0tSCUqBBl8C5om5JfHZiqobMCjQTnTzwFA6gNhARiMnIpr22Xha5mNb//972rVEgUD6MA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1a7c86-bb33-4b0d-d45a-08de554ae686
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 22:02:11.8400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkL9fLYnhL53bs4HmjWN2fBMqD3we4XM5nWmP1AaHmadiTkvFwbi+R60vaHxiTt4lVKRLWCoOTcjXyV8w/W2tcKuy+Ln4LGfFMVmB4KjbJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7267
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601160166
X-Proofpoint-GUID: VGzqt9XpAENMvE1_NjY8bgTOamad6kc7
X-Proofpoint-ORIG-GUID: VGzqt9XpAENMvE1_NjY8bgTOamad6kc7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE2NiBTYWx0ZWRfX2KHwxHM9tcIf
 UO0NGpmMq+CTcCM23wF4KTepYUwnpyqqiuUKJ6HE43vCAx/SW5vFbHAZp0fqcSc+WPT4FyNgVG2
 m/2DMRsgt3z5iyiqppWMCLVj6pIBpAOuWLCXsatjM6Z5qFVTLALbmL8K0cEl2xfvhQa++41YbOp
 bsTz9G6ZhkfEeWBB+HLG1FQedJFkcZhwa3Dt5XddQrLrQ2yCk9xQ3Q4mQzj6IkviYmsV7KxTZph
 w+hhGWWW4FnZp3rJvVrEfHXDbZMtUJjmJzVnkhJuTItbduZfdWGQsDtJToIbIG8HjEv2MLO5CGd
 kpyrJck3Wj5zd1Dr8kZshQgIPebDk6Sc854b0mDDcVmnpDnmkE0eIPMjwKgLvmTDsJaE8yGyIgj
 70DmOAHzGL0og0uvKOol8Nm1jP0A783W/zmcoucm3bJ7hmYwPsbAhWV/ZNxTTJwpwXZANozPMa9
 a94iug86toE1UcBODWYVW064WeT82XH69POq7BmY=
X-Authority-Analysis: v=2.4 cv=Aa+83nXG c=1 sm=1 tr=0 ts=696ab567 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=o4AXZvRoofnxFgo2cB4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 cc=ntf awl=host:13654

On Fri, Jan 16, 2026 at 12:18:51AM -0500, Eugene Loh wrote:
> On 1/15/26 17:18, Kris Van Hees wrote:
> 
> > On Tue, Jan 13, 2026 at 04:42:05PM -0500, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > The char array prvname[] is set for each provider.  It is used in the
> > > file that implements the provider.  It might also be passed to
> > > dt_sdt_populate() via a function argument.
> > > 
> > > However, dt_provider_tp.h also defines the macro GROUP_DATA in terms of
> > > prvname.  In turn, GROUP_DATA is used not only in dt_prov_dtrace.c but
> > > then again in dt_prov_fbt.c to define FBT_GROUP_DATA.
> > > 
> > > In commit 0b7c5a632 ("fbt, rawfbt: consolidate code to avoid duplication"),
> > > the fbt and rawfbt providers are combined into a single file.  Thus, two
> > > uses of prvname collide.  The in-file collisions get resolved, but the
> > > cascade of macro definitions does not:  FBT_GROUP_DATA ends up using
> > > "fbt" for both fbt and rawfbt providers.  As a result, it is possible
> > > for rawfbt probes not to be seen.
> > > 
> > > Notice that GROUP_DATA is always paired with prp->desc->prb.  Therefore,
> > > simply replace:
> > >      -#define GROUP_DATA     getpid(), prvname
> > >      +#define PROBE_DATA     getpid(), prp->desc->prv, prp->desc->prb
> > > This makes the code more compact and relieves the macro definitions from
> > > needing prvname.  It also makes the FBT_GROUP_DATA macro unnecessary.
> > > 
> > > The format (FMT) macro is similarly renamed and redefined to include the
> > > probe info.
> > > 
> > > Add a test to check that a rawfbt probe can be found behind an fbt probe
> > > when the probe description has a wildcard provider.
> > > 
> > > Orabug: 38842114
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > ---
> > >   libdtrace/dt_prov_dtrace.c                    | 14 ++++++-------
> > >   libdtrace/dt_prov_fbt.c                       | 13 ++++++------
> > >   libdtrace/dt_prov_rawtp.c                     |  4 ++--
> > >   libdtrace/dt_prov_sdt.c                       |  4 ++--
> > >   libdtrace/dt_provider_tp.h                    | 12 +++++------
> > >   .../providers/rawfbt/tst.wildcard-provider.d  | 20 +++++++++++++++++++
> > >   .../providers/rawfbt/tst.wildcard-provider.r  |  2 ++
> > >   7 files changed, 45 insertions(+), 24 deletions(-)
> > >   create mode 100644 test/unittest/providers/rawfbt/tst.wildcard-provider.d
> > >   create mode 100644 test/unittest/providers/rawfbt/tst.wildcard-provider.r
> > > 
> > > diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> > > index 34b5d8e24..102afd84e 100644
> > > --- a/libdtrace/dt_prov_dtrace.c
> > > +++ b/libdtrace/dt_prov_dtrace.c
> > > @@ -243,8 +243,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> > >   		/* add a uprobe */
> > >   		fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
> > >   		if (fd != -1) {
> > > -			rc = dprintf(fd, "p:" GROUP_FMT "/%s %s\n",
> > > -				     GROUP_DATA, prp->desc->prb, spec);
> > > +			rc = dprintf(fd, "p:" PROBE_FMT " %s\n",
> > > +				     PROBE_DATA, spec);
> > >   			close(fd);
> > >   		}
> > >   		free(spec);
> > > @@ -252,14 +252,14 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> > >   			return -ENOENT;
> > >   		/* open format file */
> > > -		len = snprintf(NULL, 0, "%s" GROUP_FMT "/%s/format",
> > > -			       EVENTSFS, GROUP_DATA, prp->desc->prb) + 1;
> > > +		len = snprintf(NULL, 0, "%s" PROBE_FMT "/format",
> > > +			       EVENTSFS, PROBE_DATA) + 1;
> > >   		fn = dt_alloc(dtp, len);
> > >   		if (fn == NULL)
> > >   			return -ENOENT;
> > > -		snprintf(fn, len, "%s" GROUP_FMT "/%s/format",
> > > -			 EVENTSFS, GROUP_DATA, prp->desc->prb);
> > > +		snprintf(fn, len, "%s" PROBE_FMT "/format",
> > > +			 EVENTSFS, PROBE_DATA);
> > How about also changing this to use asprintf() rather than doing the douoble
> > snprintf (one to get the langth, the alloc, and then actually populate).
> 
> Sure, sounds good.  On the other hand, this is in dt_prov_dtrace, while the
> main point of the patch is an fbt problem.  Yeah, I know, not a big deal. 
> But since we've been chasing these asprintf() sites opportunistically over a
> couple of patches and there are several (4?) more sites to go, how about I
> do all these asprintf() conversions in a separate patch?

Sounds good (and thank you for already posting those).

> > >   		f = fopen(fn, "r");
> > >   		dt_free(dtp, fn);
> > >   		if (f == NULL)
> > > @@ -300,7 +300,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
> > >   	if (fd == -1)
> > >   		return;
> > > -	dprintf(fd, "-:" GROUP_FMT "/%s\n", GROUP_DATA, prp->desc->prb);
> > > +	dprintf(fd, "-:" PROBE_FMT "\n", PROBE_DATA);
> > >   	close(fd);
> > >   }
> > > diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> > > index 3feac56ea..8dbf9740a 100644
> > > --- a/libdtrace/dt_prov_fbt.c
> > > +++ b/libdtrace/dt_prov_fbt.c
> > > @@ -53,8 +53,7 @@ static const char		prvname[] = "fbt";
> > >   #define KPROBE_EVENTS		TRACEFS "kprobe_events"
> > > -#define FBT_GROUP_FMT		GROUP_FMT "_%s"
> > > -#define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
> > > +#define FBT_PROBE_FMT		"dt_%d_%s_%s"
> > >   static const dtrace_pattr_t	pattr = {
> > >   { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
> > > @@ -508,16 +507,16 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> > >   		if (fd == -1)
> > >   			goto out;
> > > -		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
> > > +		rc = dprintf(fd, "%c:" FBT_PROBE_FMT "/%s %s\n",
> > >   			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
> > > -			     FBT_GROUP_DATA, tpn, fun);
> > > +			     PROBE_DATA, tpn, fun);
> > >   		close(fd);
> > >   		if (rc == -1)
> > >   			goto out;
> > >   		/* create format file name */
> > > -		if (asprintf(&fn, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
> > > -			     FBT_GROUP_DATA, tpn) == -1)
> > > +		if (asprintf(&fn, "%s" FBT_PROBE_FMT "/%s/format", EVENTSFS,
> > > +			     PROBE_DATA, tpn) == -1)
> > >   			goto out;
> > >   		/* open format file */
> > > @@ -583,7 +582,7 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
> > >   		}
> > >   	}
> > > -	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA, tpn);
> > > +	dprintf(fd, "-:" FBT_PROBE_FMT "/%s\n", PROBE_DATA, tpn);
> > >   	close(fd);
> > >   	if (tpn != prp->desc->fun)
> > > diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
> > > index 709f7040f..e3269f4b3 100644
> > > --- a/libdtrace/dt_prov_rawtp.c
> > > +++ b/libdtrace/dt_prov_rawtp.c
> > > @@ -56,7 +56,7 @@ static const dtrace_pattr_t	pattr = {
> > >   /*
> > >    * The PROBE_LIST file lists all tracepoints in a <group>:<name> format.
> > >    * We need to ignore these groups:
> > > - *   - GROUP_FMT (created by DTrace processes)
> > > + *   - PROBE_SFMT
> > >    *   - kprobes and uprobes
> > >    *   - syscalls (handled by a different provider)
> > >    *   - pid and usdt probes (ditto)
> > > @@ -89,7 +89,7 @@ static int populate(dtrace_hdl_t *dtp)
> > >   			*p++ = '\0';
> > > -			if (sscanf(buf, GROUP_SFMT, &dummy, &str) == 2) {
> > > +			if (sscanf(buf, PROBE_SFMT, &dummy, &str) == 2) {
> > >   				free(str);
> > >   				continue;
> > >   			}
> > > diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
> > > index 74555f5be..ee2cc3c27 100644
> > > --- a/libdtrace/dt_prov_sdt.c
> > > +++ b/libdtrace/dt_prov_sdt.c
> > > @@ -54,7 +54,7 @@ static const dtrace_pattr_t	pattr = {
> > >   /*
> > >    * The PROBE_LIST file lists all tracepoints in a <group>:<name> format.
> > >    * We need to ignore these groups:
> > > - *   - GROUP_FMT (created by DTrace processes)
> > > + *   - PROBE_SFMT
> > >    *   - kprobes and uprobes
> > >    *   - syscalls (handled by a different provider)
> > >    *   - pid and usdt probes (ditto)
> > > @@ -87,7 +87,7 @@ static int populate(dtrace_hdl_t *dtp)
> > >   			*p++ = '\0';
> > > -			if (sscanf(buf, GROUP_SFMT, &dummy, &str) == 2) {
> > > +			if (sscanf(buf, PROBE_SFMT, &dummy, &str) == 2) {
> > >   				free(str);
> > >   				continue;
> > >   			}
> > > diff --git a/libdtrace/dt_provider_tp.h b/libdtrace/dt_provider_tp.h
> > > index f131b1e02..406609d1b 100644
> > > --- a/libdtrace/dt_provider_tp.h
> > > +++ b/libdtrace/dt_provider_tp.h
> > > @@ -18,13 +18,13 @@ extern "C" {
> > >    * Tracepoint group naming format for DTrace providers.  Providers may append
> > >    * to this format string as needed.
> > >    *
> > > - * GROUP_DATA provides the necessary data items to populate the format string
> > > - * (PID of the dtrace process and the provider name).  GROUP_SFMT is like
> > > - * GROUP_FMT, but for sscanf().
> > > + * PROBE_DATA provides the necessary data items to populate the format string.
> > > + * PROBE_FMT formats that data.
> > > + * PROBE_SFMT is a format string for recognizing PROBE_FMT data in sscanf().
> > >    */
> > > -#define GROUP_FMT	"dt_%d_%s"
> > > -#define GROUP_SFMT	"dt_%d_%ms"
> > > -#define GROUP_DATA	getpid(), prvname
> > > +#define PROBE_DATA	getpid(), prp->desc->prv, prp->desc->prb
> > > +#define PROBE_FMT	"dt_%d_%s/%s"
> > > +#define PROBE_SFMT	"dt_%d_%ms"
> > >   typedef struct tp_probe tp_probe_t;
> > > diff --git a/test/unittest/providers/rawfbt/tst.wildcard-provider.d b/test/unittest/providers/rawfbt/tst.wildcard-provider.d
> > > new file mode 100644
> > > index 000000000..ad9f4c779
> > > --- /dev/null
> > > +++ b/test/unittest/providers/rawfbt/tst.wildcard-provider.d
> > > @@ -0,0 +1,20 @@
> > > +/*
> > > + * Oracle Linux DTrace.
> > > + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> > > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > > + * http://oss.oracle.com/licenses/upl.
> > > + */
> > > +
> > > +/*
> > > + * ASSERTION: rawfbt probes can be found even when a wildcard provider
> > > + * description also allows fbt probes.
> > > + */
> > > +
> > > +#pragma D option quiet
> > > +
> > > +BEGIN,
> > > +*fbt:vmlinux:do_sys_open*:entry
> > > +{
> > > +	printf("success\n");
> > > +	exit(0);
> > > +}
> > I am confused how this test accomplishes verification of the assertion.  If
> > a regular FBT probe satisfies the probe description, wouldn't this pass also?
> > Wouldn't a -l based test be better here, where you can test that the output
> > does indeed report both the fbt probe and the rawfbt probe that match?
> 
> It appears that -l is not an issue;  a -l test does not show the problem. 
> The test in the patch is derived from the user bug report that motivated
> this patch.
> 
> The whole prvname problem is that the bad prvname value makes GROUP_DATA
> bad, which makes FBT_GROUP_DATA bad, which is an issue only in kprobe_attach
> (and detach).  So, we need kprobe_attach() to see the problem.

Ok, so yes, -l is not sufficient.  But still, even if the test is derived from
the original reported problem, it still looks wrong to me.  Or rather, the test
can pass when

	fbt:vmlinux:do_sys+open*:entry exists
	rawfbt:vmlinux:do_sys+open*:entry does NOT exist

because as long as 1 probe matches the probe specification, compilation will
succeed (and at runtime, the probe firing will complete the success criterium).

But that is not a valid PASS result for the assertion that is posed for this
test.  If you are specifically looking for a rawfbt probe using a wildcard, you
might want to use r*fbt:vmlinux:do_sys+open*:entry instead perhaps?

> > > diff --git a/test/unittest/providers/rawfbt/tst.wildcard-provider.r b/test/unittest/providers/rawfbt/tst.wildcard-provider.r
> > > new file mode 100644
> > > index 000000000..b34a52d2f
> > > --- /dev/null
> > > +++ b/test/unittest/providers/rawfbt/tst.wildcard-provider.r
> > > @@ -0,0 +1,2 @@
> > > +success
> > > +
> > > -- 
> > > 2.47.3
> > > 
