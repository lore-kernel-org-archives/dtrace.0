Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507A1212B31
	for <dtrace@lists.linux.dev>; Tue, 30 Sep 2025 23:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759275848; cv=fail; b=TKcksqPmX8+TYOogxw/b8Vu/x+dlOXQy9YnOdo1MEHnH7F3Iq0BXrXe2iVkb5w0Ju9S6dPkTUjaiPiep0r5r0gGj7G6CYxLVgkwj8qGDgCyOZ3OB41gttAuK+osqhugHhSlSyecWZg5HPgKx8MJGDZ/y0tP0gIiUIJF7G3vlfXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759275848; c=relaxed/simple;
	bh=bwrs5gEAXKR0f5y3nuw2tFoxcbuYpKj8HSBZjGwwfvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Lgfw8yrLStkmC4yS/Y22yYIki83rzHyPo3saD3jYcZsxMLB3cqgCYV7ccnV0getsIZcBsCYYanaI1IpwxM87bqroCwP19zdWBAonV1JtRriD2qf5u8+EZSppJBByignVoin37GRrEHECoLKi3eqp03gJB611kg+PAcqvJBnNNdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fD4LJiNh; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GvObNxMa reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fD4LJiNh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GvObNxMa"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UKMjV0023876
	for <dtrace@lists.linux.dev>; Tue, 30 Sep 2025 23:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=4J9l9EOP6Aii09P4+7Va+Oy66uvaBAjxw3pFcb9Pw0s=; b=
	fD4LJiNhYrYcbqHnkFiHWdoC1Fe4CDufCBi+hpwFTu1IOZpgs3/P6dKR14WOU/XG
	T+D/x+xEUDK2ZR40nFPRXNDIw3jLina5pK7KCbmNjnNkclOEGpIliSd7gCiZL/n4
	3RHe3+InInX7iZl0RZntd16UmE7t8atBwXxSmcfTl0ZyRP9MH8CAqfZFlbOBBslS
	BRh6yvUwXVosh3gmj1jh8w+kBkC+1dWdPr3fXqf8C7CTfWO7Fk4V0IY1fG6CR1Un
	bk0K0+SFx98/DTu/i9ZlDBvAkv9tXMa4cEDq2vi09nd8q46q+94tBBKfKuNYYmhn
	1nJWc1CyQjP6TyqcPuCuMg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gkxnggf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 30 Sep 2025 23:44:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58ULNWb5000521
	for <dtrace@lists.linux.dev>; Tue, 30 Sep 2025 23:44:04 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013066.outbound.protection.outlook.com [40.93.201.66])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49e6c8j6qg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 30 Sep 2025 23:44:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4I5DPlRRgoMvUysUDxtG1n/q/olnMaESX2BdUH8jv+TkgcyuvIJubV1MMaMvOPgzoDLh3KWM5w7Xsquzlcd/ywSFxp3zpf77EQLHpXAIQh0aQvkdxPWhtbGP9d7gOOJ/5uZs0Ah2kd/7UUh/HZtw2SPo/cEfzoMOn4I6P5n0TL3kag67utRdt8sXf4czYR0T6JBxYktR0GkNqKxbYxrKRG506uHDfFPD73mGY4y3lxu6cxty23d+isaWM+C41RnPZyPxXJpoe35k5KMn6Lsrvi/JS4xAft00px/mIllUq58wCGnGaiwfuwOkQ+9b10fAr+Qetd4gh6r0qB2h/q9Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyVaPcxc2VuVYKunkV1X5Kg0ZEKfRVhBqZFgLK38ybs=;
 b=IXXv6LiyC7UliRjkpwXnDvZ9z+VK2I1ehvXUWTUUH3oqO9uDAv5ZRQi17sdrIYWgl5kG6U1wA4YfrBqtSjpNStzwC3rs4YQueu+jfQXIdXSW84lvds3V0Hdr0KimE7EWw0wkIQVK2aKhEOZFiyy9JprN7xds9Ql1wt/TFxwfLZHG1Y/vrKUqvhr2yw+dgkSwfPJ9b/aYBUxHqiQ3t9utzy6WtG6EIFlFyUZ+X9MKIkeVKnik9UxJQK9WRF5QfyW6xgHxzvQ+QywUWQdTrJGInYQrtGRwrayKpM+dk+lzlakR/lIXVAbFgMyKfkUO1cNjsdfxHMcoRACYIOerw30aIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VyVaPcxc2VuVYKunkV1X5Kg0ZEKfRVhBqZFgLK38ybs=;
 b=GvObNxMaFhaMfeZ/Jbn6OePG7/dgCnzzbjD2hH1QBBhXPhA0wMr48tBww0JvtNpOXtQfgPAN+th9JZ0NI5XVJdv1phw7wyK8Q1N3CEcS2uVaUdtmIIDOv+z2deIupW15u1yx6DLsc+aRFWmSTIyQvbfNs2dBQOf1Wd02Xf4/z+I=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB7342.namprd10.prod.outlook.com (2603:10b6:8:f9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 23:44:01 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 23:44:01 +0000
Date: Tue, 30 Sep 2025 19:43:58 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] options: check *frames option values against system limit
Message-ID: <aNxrPg7jE3wEGRwU@oracle.com>
References: <SJ0PR10MB56725A609D3CFEE2E6011B9BC21AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <6da54d77-dfe0-ad6b-f9cd-b042ad2d632d@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6da54d77-dfe0-ad6b-f9cd-b042ad2d632d@oracle.com>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: ce181a10-0c17-417c-09f2-08de007b3b5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?EnnhzZiYTyP0byYA3AcJyBeYXMteJHgiFRqYUboLR6pSEEcG3j425sivu1?=
 =?iso-8859-1?Q?87Z4pz2LCcK3YvnPyIzObRJWNFyXMeiFra0h14zZJBrRQb0r6YdHubblZ2?=
 =?iso-8859-1?Q?7PFXyNkOFyzY3Ggkudskrz3rBbtLQZZqkhXQXuAOZCWjim77oAu+mRTlu+?=
 =?iso-8859-1?Q?Qw4CtOVTa9be8wQTt+PKwmBEaXSGF2VrZsgztPRBE5oqRT8J8h7GOol3+t?=
 =?iso-8859-1?Q?00LbKAf1ohAewxcqZMD5MzYL75aL2wmtvj8HWFYtb+nF4AnazyeqF4YhBd?=
 =?iso-8859-1?Q?lAqrEvoFhkS8KdrmTmhDViysFbjan8BikD/1KnqvZQVdKxs86Z9Ri/NDVW?=
 =?iso-8859-1?Q?JqJ9DaeGlRj0gHnsD4sNVu6mnYrVuX3raqvW3mNTmeRx+9+B7QTrzABL1z?=
 =?iso-8859-1?Q?sRAzXuRlh3STl1aUs+UOGJj72t3XZ083M1ogMsTAa2VR3CFrqF2hG1rok/?=
 =?iso-8859-1?Q?38bxC5fEkcHYRLPh9Ny+KHg2YKsY57c8doLWPldKLH9Y7/w28RS8WIIqsP?=
 =?iso-8859-1?Q?jdgHtp3iG7G0cC+o1CHkOz53fQXHJpjpBOVwl9C3IQr7OoamPuKmmpQeEX?=
 =?iso-8859-1?Q?3fTKLBxNcS42yoQO3ca3r5twvMtDOXl7FmAYzc+mFRsZaaLX0JISzy6ei0?=
 =?iso-8859-1?Q?NRdHubcZ/0IPtK80K7v75acTH3ri9X1exqN4y7dBmdhQIqbs2LvEIhCzJt?=
 =?iso-8859-1?Q?2KuSZ+Ba1q4kTcJ7WtBMKPd6L2i5lHsZWz0eUd3DiweD1L5UXeaKwhPDHl?=
 =?iso-8859-1?Q?v7HXim8n8VhEOvY84Tq0pSJC+yKTskHtLvTh45OwcUvAzNfBP0H6K7mel3?=
 =?iso-8859-1?Q?T+KBauSqzR2j1Td8KRvyVSi0yEAu/ZKPkPNn7JRkgjUuLTrkABdLKLzgC5?=
 =?iso-8859-1?Q?XpkCQxq8ymUu8AkkxpvBchKc7rHbdfI/6c5McL3OiF0VU6wwO9CUtBWAg+?=
 =?iso-8859-1?Q?NT15IsWxT8Ya3/QmpHCq2dCRsLxG++y59R4l37qjJj0GFml5MWNOP9AbHB?=
 =?iso-8859-1?Q?/276KQL5NExLwPEzAQIbKMRjNKUy1q9OcqtvQJOfimaJRN00I/XYSlAh83?=
 =?iso-8859-1?Q?w3lV6pa10STqcrUEggh8V1F/KFr2RALPr5WPEvQqYe6D+gLYYKdRk2nzpz?=
 =?iso-8859-1?Q?Y+YWN3MaOAIJL2SDQKkvNzsQs7OvkZPVHA5hmJcEkBkbwyMWkXlhcLBEbo?=
 =?iso-8859-1?Q?tTJEIagStjPTwE+aO5cAv3GL3CclEFMDFQL63tRH/j/rNjusabWrmh5COz?=
 =?iso-8859-1?Q?1uVzYLYJNbq+IZT2MLXSePYJehsIU0jQKWJjcIG5whcwDifDgtDG8ou97O?=
 =?iso-8859-1?Q?cCWyIm/eCD1aZ/EFcyKV4HMzuxvvUXSNWtSAJNbT84CBA0rz2Y7S/LEeo9?=
 =?iso-8859-1?Q?DQ/HAZaeeczXIRxeOu2NbwPmQDYx6iNFwwEG0SfHJFSyqPyJHN5nPZO6Ee?=
 =?iso-8859-1?Q?u6RqgheWaPDzUd+f3M79ahJK4Yj3DYfHwGDRa7TypPdHYnou3F6WvJ6YuA?=
 =?iso-8859-1?Q?3N7VWYiE55aBEoKMOVhM9K?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?2zyiQtVihOohffQWNcXhBKqtEFaERAccDWgBfeUmEiMuwiSM6U91EE4CQp?=
 =?iso-8859-1?Q?MCGtxRw5YX8sqwiJrKYyl4hQKNTmXTmHqm60YX1QaJtVbfpflmH5eUJ9v+?=
 =?iso-8859-1?Q?vv8+I9fhG63jLJxVD1kB+zSt2ZK4+po2boCWLcXuLaBE32McTjHOAM6yeo?=
 =?iso-8859-1?Q?oRGFNusTREZuJnNUhqS5qAfNzjzlcqdVmvB2BLN4PIWonPzY4dB06JZd+V?=
 =?iso-8859-1?Q?xsHRsSUuU28j6YZVT2ED6SkNRmusWxURDtJOuj7d9LJmC9OkdgrxrGowlp?=
 =?iso-8859-1?Q?pF2VVQ1UyHQeLD/Zqne+8d2h4ic/djXwL4GijvzasfEke6dWSd4yPygKke?=
 =?iso-8859-1?Q?a5tVZG6kuumHnrN6RidTYdxXUbK6HyIw/SEu1SLGLWSVyURBMC9EpwT34w?=
 =?iso-8859-1?Q?K1L3PBQn+VhU5lLFV1ZFCIJfT2oSPD+vj0DcWyq2Od3v8joDdDsXaoUD03?=
 =?iso-8859-1?Q?lvPgEpFsUB9uPtc42VNVbYu4rZQ2cFJxnzJOlRIXH4dRRuDu8/Bde4pNnx?=
 =?iso-8859-1?Q?GOGcuWtssY51cNZZeWpy+g3JmqTq401vxm2+YVRFNoVI+PpJAeFmpKhujV?=
 =?iso-8859-1?Q?aa53YH+Saxo87L/13LlbDyjbwEEmk56//qu5+uq1e8xSwKgUMyzNfoME5X?=
 =?iso-8859-1?Q?42XzkxvlkcOinOzT0Dl7neZQqYVQvfH1GfqhPd9mTvyB3Pn2CJ8Vr/8wCR?=
 =?iso-8859-1?Q?LcgXn2XEwc9fJ4GfwLc6Bhap2mm8LCGZGqv3a3rSMzfa1LKUa5PCsWOIT8?=
 =?iso-8859-1?Q?A0ET5DsA7EvcT4hLY8VfGAzcPMC2E8SQn9FCb6DkBqPw+OhL+F3n0hL2jv?=
 =?iso-8859-1?Q?wtvDhojskSZlzU4BV26zgtRrUgYGnGkkYVJRyjUP0fZ1cVqYolr4PDjBPK?=
 =?iso-8859-1?Q?GL5QccZEepFuA3swehlXooeabOhwSfniGZfq0TtwugAavqvhezoGvreE92?=
 =?iso-8859-1?Q?7gJva+Qk8egJJWtaGuSbzCZ/sEKvd/g4Pd2BMNKIzL/vcrCy4ozPizkCuK?=
 =?iso-8859-1?Q?qE0/qNyA6iBVZeyDkwrLWwaQ8D2h8NhN+Y8wk7YO42BlOrdjIFlULrINT7?=
 =?iso-8859-1?Q?yyF68dIrVjPLlUv3On/ikW8i9UuKOvldPtuE0+bo8KULpSWwn+DUkWhW8M?=
 =?iso-8859-1?Q?6ErDuRN/sHFVMDRzNGbzli9m+LyzO6yUEhhstUbJXBjYXTUQPRk9bqwRD1?=
 =?iso-8859-1?Q?gj68unuvD7f4019/IbPrsZ/po1TqArwUbNMxKxBdc67Ww0xEcoMh9vZGma?=
 =?iso-8859-1?Q?lyGWDqdRERRq2tfVJymPNfsFXNaX1Z4kBq4uEfonlabMtSZyt6bQ1yABec?=
 =?iso-8859-1?Q?SHbKm4curY94jPIkj2o7H6quUYx90dduHV4oglJa+zS4ESsjgWiyJm3c+2?=
 =?iso-8859-1?Q?6BLVyC8Bli4lqmMalgrCgeu8J3H5z3947R1UZ3wEUqBsMZsffkZsq7rsv1?=
 =?iso-8859-1?Q?7I11GV73Us9VQ9rqiZOHdSlQgToqp3pDrGW9m9ZeoWH8HDhqAmAMZGTjZE?=
 =?iso-8859-1?Q?DuNuaFPJmzu/wwnv70Yjjtnx2Y1yipcryQzGjNieVkIDS7oFRWJoFMcTxd?=
 =?iso-8859-1?Q?F62vPlmuHNORaT0lRmEpgXr4Db92ucGzi4gJzwmVsdo1/ov90pUJTrmSc2?=
 =?iso-8859-1?Q?BMTDvtPYY+otiIVxG3e/nryEV9dbaG6FCHwSKmPHZtliruKVmqqCtbMg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QS8k6cwFq/jk5sU+/F5V4BY3UKWPCqy+4wpt3jrTHXusvbaTBWsAAB/vxjLpvlQweeo2QLixcyUA7/E+Jvz6UqN+Re4c/MEgNgZqZMKvlEduB+5OOvhHSuBgeARuppQ2uaQFJlrrcsQdP/YHvFwB6xFMBFYRtidVRuXzoBhG9sSbOKvalPYIouZG5zcHpKTTGKdLnCoyhXacRb62apndLxodrRO6LLztN+PuDwLuL0t21EXB9tWH4FJmAkmibzN1kYukYXTyzOav6XbQWkemCjXlEaUwqurvw2+9a5vM4oZ7tbkU5ybYAYgHyVw0q8A+DnmhUjDNJGpIhQ3rR7psexMiZX0beePd2wp3sCzXUG/6z3keEocKzcWLY2Vggx1XaYhK/KhtY+h749w90R0Nf0Zp5SLKyhHQ1CrQdDdXhchLuKLv6+14NSEnRZBBajkS7ocUU+MTlThyNixDFPlp7BS4JJ7FQekTzdKWJSm4q1IXg4ml6ABIefVT2KIh6SDjcuYoIO2EGVJI2fZOTbGU2IcDZN666ktws8SQ/1z9NJDxUUq76thauLnbfKJvuGcYFEb2xGi2Ga6fyhRetbBbz8AXG7PZDqudnkyR6KAxSP0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce181a10-0c17-417c-09f2-08de007b3b5f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 23:44:01.2390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPIzA4i47Tetj7mVHxbM7Zy6kgytp/bIpx++oMjz6rc+x1mrJ4aQ1alTQpcOUUxGMI5BGRNsrvADxIllYCwTFvrC39G9q5O5XLOgp91qr90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7342
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_05,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509300216
X-Proofpoint-GUID: gYynxrUGONnECOhN6jgIoInjb9vavzz6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2MSBTYWx0ZWRfX6ThzSsSz8pis
 XLU7IsmfofmQIXEKyed697e2lDRbZkHO2R79p8oYBPFLyzQiTH8T+syUOe/T89FBBdtr5j+Ay0r
 9eVibfnpg11/88QuAgUcpiWsW18zensYTZUhpEmBufImNNNZH8fLNsM4sRxgbvchKb1aN2328BO
 Oq5rYlkaXnm6GCwQPCGzVCk0A751faU2qEJSULyb99b7+nmJ/rn85K81lEy1flNE3CF1ZQEmDMd
 sg+oUcgNSXMSdMJ3PL5qjtSE4Tm1IWd1gT5arBj3tx0qWR4LG5ta4h/Zi/KrHr7W289qnJuLYvz
 8RDe2UGEVJbwt8bwLBvPAnYCxSNpcT/ZaEX2vTP7xfpwGLt3//QCFurEvpmKYVTjWDfBxlOzAai
 sFdDg/1IbGD+fEs8VaTvodLmzaW4VN2kXfRJH/G+Hxn4j/RBt9A=
X-Authority-Analysis: v=2.4 cv=RLW+3oi+ c=1 sm=1 tr=0 ts=68dc6b44 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Y4RTSCcT9jB_keFgqDYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:12090
X-Proofpoint-ORIG-GUID: gYynxrUGONnECOhN6jgIoInjb9vavzz6

On Tue, Sep 30, 2025 at 05:31:42PM -0400, Eugene Loh wrote:
> I'm confused.
> 
> Is this amending an earlier patch, which introduced dt_opt_maxframes() -- a
> patch that has not yet been applied to the dev branch?  If so, why not
> rework the earlier patch for a cleaner commit history?

I think it is cleaner to do it in two patches mainly because this one is
adding tests (see below) and therefore is really about this specific change
rather than the introduction of dt_opt_maxframes() that was necessary for
other things to work.

> What observable change in behavior does this patch produce?  Why isn't there
> a test?

Oops, I forgot to include the tests in the patch.  They will be there in the
v2.

> Also...
> 
> On 9/30/25 12:47, Kris Van Hees wrote:
> > Commit 81e99397d ("Add support for the stack() action") added code to
> > retrieve the system limit for stack traces and used that value to set
> > the 'maxframes' option.
> > 
> > However, a user can set the 'maxframes' option from the command line,
> > which would allow setting the option to value beyond the system limit.
> > 
> > We now record the system limit in dtrace_hdl_t as well as setting the
> 
> In general, "now" in a commit message strikes me as ambiguous.  Does it mean
> before or after the patch?  Not a huge deal here since the patch quickly
> indicates that this is new behavior, but I'd prefer avoiding "now."
> 
> > 'maxframes' option to this value as a default.  Options processing now
> > ensures that *frames options cannot be set beyond the system limit.
> > 
> > Note: 'stackframes', 'ustackframes', and 'jstackframes' can be set to
> > a value that is higher than 'maxframes'.  The existing immplementation
> > in the code generator already lowers their value to 'maxframes' when
> > needed.
> 
> This seems to contradict the new comment in dt_vopen(), which says you
> cannot set to a higher value, and the behavior in the new dt_opt_frames().
> 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_impl.h    |  1 +
> >   libdtrace/dt_open.c    |  7 +++++--
> >   libdtrace/dt_options.c | 38 +++++++++-----------------------------
> >   3 files changed, 15 insertions(+), 31 deletions(-)
> > 
> > diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> > index 4dc4c9a7..723aac8b 100644
> > --- a/libdtrace/dt_impl.h
> > +++ b/libdtrace/dt_impl.h
> > @@ -310,6 +310,7 @@ struct dtrace_hdl {
> >   	uint_t dt_maxtuplesize;	/* largest tuple across programs */
> >   	uint_t dt_maxlvaralloc;	/* largest lvar alloc across pcbs */
> >   	uint_t dt_maxaggdsize;	/* largest aggregation data size */
> > +	uint64_t dt_maxframes;	/* system limit on stack traces */
> >   	dt_tstring_t *dt_tstrings; /* temporary string slots */
> >   	dt_list_t dt_modlist;	/* linked list of dt_module_t's */
> >   	dt_htab_t *dt_mods;	/* hash table of dt_module_t's */
> > diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> > index ed0b14a1..ba5463a0 100644
> > --- a/libdtrace/dt_open.c
> > +++ b/libdtrace/dt_open.c
> > @@ -764,13 +764,16 @@ dt_vopen(int version, int flags, int *errp,
> >   	dtp->dt_options[DTRACEOPT_SCRATCHSIZE] = sizeof(uint64_t) + _dtrace_scratchsize;
> >   	/*
> > -	 * Set the default value of maxframes.
> > +	 * Set the default value of maxframes.  This is the maximum of stack
> > +	 * frames that can be requested from the kernel.  The *frames options
> > +	 * cannot be set to a value that exceeds this limit.
> >   	 */
> >   	fd = fopen("/proc/sys/kernel/perf_event_max_stack", "r");
> >   	assert(fd);
> > -	if (fscanf(fd, "%lu", &dtp->dt_options[DTRACEOPT_MAXFRAMES]) != 1)
> > +	if (fscanf(fd, "%lu", &dtp->dt_maxframes) != 1)
> >   		return set_open_errno(dtp, errp, EDT_READMAXSTACK);
> >   	fclose(fd);
> > +	dtp->dt_options[DTRACEOPT_MAXFRAMES] = dtp->dt_maxframes;
> >   	/*
> >   	 * Set the default pcap capture size.
> > diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
> > index 7508f044..97516517 100644
> > --- a/libdtrace/dt_options.c
> > +++ b/libdtrace/dt_options.c
> > @@ -913,40 +913,20 @@ dt_opt_rate(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
> >   }
> >   /*
> > - * When setting the maxframes option, set the option in the dt_options array
> > - * using dt_opt_runtime() as usual, and then update the definition of the CTF
> > - * type for "_stack" to be an array of the corresponding size.
> > - * If any errors occur, reset dt_options[option] to its previous value.
> > + * Set a *frames option, ensuring that its value is within the system
> > + * constaints.
> >    */
> >   static int
> > -dt_opt_maxframes(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
> > +dt_opt_frames(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
> >   {
> >   	dtrace_optval_t val = dtp->dt_options[option];
> > -	ctf_file_t *fp = DT_STACK_CTFP(dtp);
> > -	ctf_id_t type = ctf_type_resolve(fp, DT_STACK_TYPE(dtp));
> > -	ctf_arinfo_t r;
> >   	if (dt_opt_runtime(dtp, arg, option) != 0)
> >   		return -1; /* dt_errno is set for us */
> > -	if (dtp->dt_options[option] > UINT_MAX) {
> > -		dtp->dt_options[option] = val;
> > -		return dt_set_errno(dtp, EOVERFLOW);
> > -	}
> > -
> > -	if (ctf_array_info(fp, type, &r) == CTF_ERR) {
> > -		dtp->dt_options[option] = val;
> > -		dtp->dt_ctferr = ctf_errno(fp);
> > -		return dt_set_errno(dtp, EDT_CTF);
> > -	}
> > -
> > -	r.ctr_nelems = (uint_t)dtp->dt_options[option];
> > -
> > -	if (ctf_set_array(fp, type, &r) == CTF_ERR ||
> > -	    ctf_update(fp) == CTF_ERR) {
> > +	if (dtp->dt_options[option] > dtp->dt_maxframes) {
> >   		dtp->dt_options[option] = val;
> > -		dtp->dt_ctferr = ctf_errno(fp);
> > -		return dt_set_errno(dtp, EDT_CTF);
> > +		return dt_set_errno(dtp, EDT_BADOPTVAL);
> >   	}
> >   	return 0;
> > @@ -1194,19 +1174,19 @@ static const dt_option_t _dtrace_rtoptions[] = {
> >   	{ "destructive", dt_opt_runtime, DTRACEOPT_DESTRUCTIVE },
> >   	{ "dynvarsize", dt_opt_size, DTRACEOPT_DYNVARSIZE },
> >   	{ "grabanon", dt_opt_runtime, DTRACEOPT_GRABANON },
> > -	{ "jstackframes", dt_opt_runtime, DTRACEOPT_JSTACKFRAMES },
> > +	{ "jstackframes", dt_opt_frames, DTRACEOPT_JSTACKFRAMES },
> >   	{ "jstackstrsize", dt_opt_size, DTRACEOPT_JSTACKSTRSIZE },
> >   	{ "lockmem", dt_opt_lockmem, DTRACEOPT_LOCKMEM },
> > -	{ "maxframes", dt_opt_maxframes, DTRACEOPT_MAXFRAMES },
> > +	{ "maxframes", dt_opt_frames, DTRACEOPT_MAXFRAMES },
> >   	{ "nusdtprobes", dt_opt_runtime, DTRACEOPT_NUSDTPROBES },
> >   	{ "nspec", dt_opt_runtime, DTRACEOPT_NSPEC },
> >   	{ "pcapsize", dt_opt_pcapsize, DTRACEOPT_PCAPSIZE },
> >   	{ "scratchsize", dt_opt_scratchsize, DTRACEOPT_SCRATCHSIZE },
> >   	{ "specsize", dt_opt_size, DTRACEOPT_SPECSIZE },
> > -	{ "stackframes", dt_opt_runtime, DTRACEOPT_STACKFRAMES },
> > +	{ "stackframes", dt_opt_frames, DTRACEOPT_STACKFRAMES },
> >   	{ "statusrate", dt_opt_rate, DTRACEOPT_STATUSRATE },
> >   	{ "strsize", dt_opt_strsize, DTRACEOPT_STRSIZE },
> > -	{ "ustackframes", dt_opt_runtime, DTRACEOPT_USTACKFRAMES },
> > +	{ "ustackframes", dt_opt_frames, DTRACEOPT_USTACKFRAMES },
> >   	{ "noresolve", dt_opt_runtime, DTRACEOPT_NORESOLVE },
> >   	{ NULL }
> >   };
