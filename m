Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546792882B9
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 18:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753122649; cv=fail; b=rQC4s2bG4xK4gexMFCcsjXbC2Appv6yFvYACx67CcVDZaWz8AUnLYCeTo7fU9I1wlDAkf+3lJzVr3vo/WzKKFJ+aQHgusj1wxRZaZMlYTKFIuwuaA91mt0YcFEctvgVGP0h/IgNq2Yq0YpCS1FgkVcgf5WdFZ9IXDXMukOx2BkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753122649; c=relaxed/simple;
	bh=/SuG6ksqJTBpVD8rIQHGsG2iyINcJ7Hir5EtbNcxz+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jgmxanEkbuh3iQdh5AQ5qFfYsDYvFphkdSamg6ZsZEYdL16TAUHZpx50CU/ntDpJujVzayMWDQkGErvV/BIwH/5biIZh9rtRa0HJ712P9uptDCyyLpmP1RqdGAaWIU9WgT2ZDBiDpGqDwlJZNYLP/OYZH2Vlb5HdpruPfrJJ/Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dmHZjeDr; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FrUMtkrQ reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dmHZjeDr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FrUMtkrQ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LHg1nn029035
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 18:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=+t7mtG7HTQHoqZNl6vWGDRxMgHVw1MYLT5Twf9lgJIY=; b=
	dmHZjeDrosjnMBFSg79OqzPAN6sxtz4zkRundD126qxBSvnWcph9pQEIar8Nx2ty
	1uR3Xp4x6j/uqIOOg5PQBoQhmqXkFFSxYRcu5IdYkbCo7uo1bPHwHyFbDYhdpIGg
	h4/Nk5kLdnor2f5Z6RK1LULxgzYnnAxcgX9tVZcfGP9UmCeumPufCma3IyMNn1Kf
	hWO8JVy42VAhfHhYU/aWil01r3Zmuy0x2XIjFNmCirojRw6pBZcCqBuJCW5AKbcP
	Mi4W0BlEv11uT1dm0eq/uxgEj+B9xaWOwtRwLP6pB5K6VyZRteiRVzdWHoe8OhSF
	C0yjln8JYX92bYCNfXqBZg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805tx3fud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 18:30:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56LHYfm5010253
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 18:30:44 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t8d3mq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 18:30:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrgtejSgw6DZnFcCyh1g/UWFdsfXfvx622a9n53BwY7BLbkey8xOAdYwVoNH+xkQDfAVJNmw9Hy3eKli/oe/JoTVCzy6wY++rjA4sSBFBRyHJt3KIqE3PJ3mXuuITSgh1lbNM43fbuXPvTkyChYhU2VmyQm8TcHPu/JZ67apMF6JpthuQKf0zUAK/m7gC/rUjvaOycHqwYfSPZlqXi0tYIvuoSFs39/iV0+HgwK5NtU5QggEn5mbtnQWk7A+DbbItTjB1KfnlY0B4wPv2xbliPttmczEZmYRA/nqgl47xnJijjat/WUaohUsKwBWd3HExfU1aoK2tZ+EXQ6kDWrAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nRlw2VlTJJDcbt6BGsZYSIPav/yh/3S22/JgJyI88o=;
 b=gIjiPo/wEnnbMQUwO+4Z+03UCGXeNdn5DNuUNKxDGcdEXF2JlN55qSOR80jCXEmNuYtWyM53jfsPRsGjZNOh2/jnUKcTmM+cJpCETdCqdDbSWQyH5rCZ830rCSBUSqOu9WWEoDjnfEhLLtm1z4Z6q/UXSwkzPEpQ42PzeYj0gv4Dw8AsDBXrOfPB8dz5ba6L+LxswY0LxqaxmGwKPi6NKe2QVD1pdcmYz73CPOhNmQInbNQzmrLuExjIaWMvpOZ9K5PWRvNQmllxN1REUPhLGxpFm+9Tl8c9pFBqa2lqZQP4RyAixEGHQ4D2KcgLkpqzdswTfdZktbUCXWArqn+3aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nRlw2VlTJJDcbt6BGsZYSIPav/yh/3S22/JgJyI88o=;
 b=FrUMtkrQMsTK8rC6oXnpboF4nw2aHzsuzuUQfxrn0Npmv8SU3jfICw6EHbgPuyyOXZ8TqHXZW3VTMUwkD5yv5VYzZtFcVXyMpOysFJLd8OSKhyx2bWPkgNHOqd7u/saO3OqiI60+S8n1iAmDHCN0cLbEX5WRK+P9YHCpmBlAzaI=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ5PPF4B2F62DBB.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::79d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 18:30:41 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Mon, 21 Jul 2025
 18:30:40 +0000
Date: Mon, 21 Jul 2025 14:30:37 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/3] test: change .r.p files from /bin/sh to /bin/bash
Message-ID: <aH6HTeEhawujUg4U@oracle.com>
References: <SJ0PR10MB5672FA7CA4991AE52AD88A9CC25DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <ddc2bce7-0907-509b-c32c-00430e49305a@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ddc2bce7-0907-509b-c32c-00430e49305a@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ5PPF4B2F62DBB:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f895c8-28f7-497e-e892-08ddc884b227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?7H4bGUThjoJ9agX1xLRsHvX8KjC/kUza9o9qyQlXi5TklZsoW/6xRU4MeR?=
 =?iso-8859-1?Q?s87UnrzAaF216ROtnkRMg40HtwSIBE0RWhjW3oH32bAHn+jCLSRXCP6RMa?=
 =?iso-8859-1?Q?JpY/6MelJlCgylTrWVFk1Tgah2f2A57j4f9ga9EIRGauwr2oe65DGLaotz?=
 =?iso-8859-1?Q?xQeW1/s7FAOhTJoGvqlmaOwWJwdN6PzwrlsyJ65nsU7jXe+gbfBoEUXfkA?=
 =?iso-8859-1?Q?zkYKmis/T0WrRtbicVRylipPR71wwkR4YwAgbic8a2aXJAg+LCfskFq84F?=
 =?iso-8859-1?Q?Cx/AVSz1/4fl/4Wqjmo4hs4f6rDZqLHDv21ot3RRfZYkiQ9aCm5ISyczO1?=
 =?iso-8859-1?Q?K3PFZL+/eez9p5lWJpGrWriUKqcj7VdZJvVquHOtv1byV0w9fWprUO7HHq?=
 =?iso-8859-1?Q?0XXKOfbFRqpJ6OmxbK8TjdOH+lFDljTNdXl6IUu5SZMhDx7Ah2Xm/JuqMt?=
 =?iso-8859-1?Q?D3QfJHLtGsGXG3dZ5/lZ5hwTgRh5H6lbOOXrbeQhY+6V46FBIsXAuEO1rq?=
 =?iso-8859-1?Q?7HcWPzSEQTboqtVK2Blp3UquiIlgA6S49x086cmdpjM/Bc9pkuX96KMHdD?=
 =?iso-8859-1?Q?ZOAXLoQyxoFbP/BLY6JZ3nJXi1I+rSaheWQUQbr/vyD2AYk/XXwkCX0ayj?=
 =?iso-8859-1?Q?ANV+79NTcK/Gbb7vtxFs7SgktodwVF31Ve7AGaHRXDY2iPVFowr2Uz5Gem?=
 =?iso-8859-1?Q?Owd35mxQDp9sOBzA66WxQRRSHaTjCgKHkEEihl4vrsU7XUbMBvtGldOU26?=
 =?iso-8859-1?Q?kGzoL2J9Z5DoOf7MuUjeDAhfS5/p83mrOo3dirCAsY8KmI+VsnjNAtCLco?=
 =?iso-8859-1?Q?XCjrLMj2Sf1afsGJvqUH4U/k65eGGaoxY1RN9J0qBONByqqi74KIMfQ5Rr?=
 =?iso-8859-1?Q?IiVx+nXf/KXxuWGNSwKaTMatMK4o8CezHGZ9eDRAeVoari59EHzuyTgL/0?=
 =?iso-8859-1?Q?yhExRnxyDR0OH8v3Xe0Bb1oh0UNotFU66Eimzow/LLonNHefZaEGBHex5V?=
 =?iso-8859-1?Q?XLOnY31Q0L943vLEY+MsWzU0s7rZqNqe6BXyKbsMstf4vikNQP2M6uzV08?=
 =?iso-8859-1?Q?8wWkoKa/5kpbQAWM5gplnPRp/lUh12Ho6RhldXM/bH/uuLEVbdxlSZhFz9?=
 =?iso-8859-1?Q?9/cwTSslYgbqb0l22TB0ji4qYXR09cuuUyecG97IPl97ZSLLjP2Vb+4BTX?=
 =?iso-8859-1?Q?wOH+Z2auTj/bs5xLi9J8+k5w18tKIc/mSCHgfNFc9S0un4NdfyucXkHPtZ?=
 =?iso-8859-1?Q?LL1cEs7xVKjMX9Q36UirIikLXnq0Ctm+bIfCe98ftHUQhHee4TLTVpp1Pp?=
 =?iso-8859-1?Q?UUqK1ceJzFZJ+n2LGQ8fK5iYzi271ZYY+khQl5oKWvsfJLB3lRtYFl9cHb?=
 =?iso-8859-1?Q?+yxmH7ghRJ0h9y8Fherudpjd1KKN3tEKnpWu42nbXShsBuBuzRz1Z5wQnv?=
 =?iso-8859-1?Q?rThsh0CitO/OCS/jIfPI15eNWzCLqYKIhbLtBc2ePA1yjN0BjuD3Uko23z?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?bhDo0QaZ604FSZR24vu3dmsHta8L+ccPt9EczV4j+sDyF2zyigPQCiTop2?=
 =?iso-8859-1?Q?GVKkImV4ajDvs17mp3tGVlc0GraOvCHHJx4lNVWcumxKvSFjD0cARmkZxh?=
 =?iso-8859-1?Q?Wy0i9hR8w6y86j7yjgCqVv1aLdOapc7QurXtMru0LNmzmgJ2L8LHPmJ5UJ?=
 =?iso-8859-1?Q?gQL+EvJiC035WfVTv0pJyGgoHXgMxh4w3XKpUWnM0iZIC3l5wux033qmws?=
 =?iso-8859-1?Q?udLpCR/SvdppGEnF4J46om2tlrWsL9afQ00bWtjT60ygJoWQkri5pSfXqJ?=
 =?iso-8859-1?Q?cBMo7TSolwMbgcJxZOvg3PWsEAsy5GGaeanMAve9iX6tYEwxaycriFhnEV?=
 =?iso-8859-1?Q?XDPUShef/rDxmfL9Ms2CeVx/ZTXr87jHho6IWjSo1v34OHz/PkxLi06xqv?=
 =?iso-8859-1?Q?yhhdZuyZfi+lB+KnTH4LLOx5pQ0haTloVAggbqGvbyE8gB8BGUugRY1Ryt?=
 =?iso-8859-1?Q?CaHs7JP1Zuz5rQ6k82ij+nDinisajVOWahCFy+I+/x9nIeJPydWizJN5cj?=
 =?iso-8859-1?Q?+jYOb/O640gOEuv+SqOGPn4qkjrxmg7OtC77t/I/MeQZGbZQkIbi0xCiOX?=
 =?iso-8859-1?Q?JtCRCxxR6uDefHd4Y8z1Clq4ilRUwsFq9gVliGTQIDOGhA+5DgWl2YUtfB?=
 =?iso-8859-1?Q?Iv7EIkjFzRL2mFSy+UXBbCrfVXoSRMurF6GkLY/RrsJHgj22t2Ob7FKow1?=
 =?iso-8859-1?Q?qzjaaViycne81+wEY6HIxGWBFJvqHjCye/yx5iG8KK2glmAB/AlTFHLZsj?=
 =?iso-8859-1?Q?R898+/q0I9y/jM76vMx7v0M0cTC0cdhtyMQvZEIsFSGpUrYUg8wGx1FTG7?=
 =?iso-8859-1?Q?stJ7TQvIVREjrcgTRAIER4vDNTE8qW0bFQQ7U11gQKqSPhFFoCndzXaIex?=
 =?iso-8859-1?Q?JoliI/KeYvUBDHho4oNM/0OPLTVwW4ylE7QyUU3z3K6Pz7b+Elw7zuT9I7?=
 =?iso-8859-1?Q?9Giz6g5qz7yVOsYS1QeqFsTqeYWSduiZvD7uXJgfjsfXMw7JqUaYduXrQI?=
 =?iso-8859-1?Q?swBovSXN5jg/XQFjwmLthR1tfH0vPDS9HcNW6Kuq4jbIJMj2M4qsqx3vi0?=
 =?iso-8859-1?Q?jXwrVP3RHB/3M9Xu2Xtnf/qwdIVwnXtV/o8Zl4CLhopZQbsKyJW/fb2DVn?=
 =?iso-8859-1?Q?ylrYI9dydJ8APohBvWLgAkeF4XbZC50PYOrtvfza/jk3bEsMSkIw1wkTLo?=
 =?iso-8859-1?Q?fH9oeboRKO72E2Yt6jmWug6X+p+1tP76TpnusPkIDld3TBI0QY6audXg89?=
 =?iso-8859-1?Q?DOSC8Gs+Yhq/9UwvCKzIL0w2Ezxfi3pwMJJsSTOqTnvOSs1Is4Ps3O6Q6Q?=
 =?iso-8859-1?Q?2Ne1sJQsS+fBz0diRcbwQklpXZWe+O2qQhbG8053+opY4ID7z1Fu3iUZf/?=
 =?iso-8859-1?Q?/eSTjmeOuFvWFkYJA2P3s3EW262hg9bozikfutnvI2Mn+ZY7ldmuHyBrrS?=
 =?iso-8859-1?Q?ERcbfh1e92s4nx5ubiSR2u/ZMk+xLQsnMLUzDl/ffyGdLF0TBY0QHNBqo7?=
 =?iso-8859-1?Q?bi7zJCsKYv/iDDDiDDUi2Smy4xAu5v5TrYbK8IsVCJz6qYC3B5GiaoFeQs?=
 =?iso-8859-1?Q?GU77dlBdet7tfipOYRjXn1qNKooSWqtlFVHhcrUxE1tMrO7W4jRwl0EP37?=
 =?iso-8859-1?Q?qfWTXSz0Mmwf+9n2um8N77zjhzNVGFoUqb2VrztF4jVaXYlieeOAAnNQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GSoDMfuzOwH5CIhxVBFmqEXSYqRASJwU4rjb/w2DYB5W/X30YLqL8/qI1ndzduOnhf6JvpxtAlQOPhWFBwlRWuiyddkHVJKBiW8L8jiMfyJBfEnY4sW0e3XmR/19h/N4IGnOuA3wLzaprWSz9JwUAaenbeL8Nt/GwX3vwB2cUPZW1Ej/XScjJMJX7VM0MSDvp2OYOGvCLKY7urNLVz8W2NEXSnnyfN2WT8gfzDJPQrIOrSQ/I4SgDwtgIgyVhQma8lfV4nbA/LAccXfN1DfpzkGCDcvfN7EqbosXJMfnsJ6IWdGSGgsz+DoeDQhv6myMJ7kzjT0kqxX+rUG7InFYocaZd9B5sPOLgtuBzX0tO+zL80maBjFbquyaUhC6XAmV+OqUhk6PtqU7Xe5n13u5IFCICr2hjSf9RYA68UUiq46zmQn0u0ANG81MSdd+AY3mgGBcZfId5wYsdOx/kepaNv1+OBo4JpmI6WVZfxGqPvI3AoDk4JAERZJ7XBD17RSyyuDP7B26AmbsmY3zh9eUD4+j7ix2zyY0L4RSWTopam4mP19Ua4OG/aMNtzBLhI67P+ng1/lXWuMo7Jdd70b3WRQbHhcqNrkmsSQgAGEKnpM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f895c8-28f7-497e-e892-08ddc884b227
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 18:30:40.8719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BSJlhe2px4ZVCKPf+DIT8/R520Qp/ro5oaXv+0L8JFcSsySAMV9jv6wL9ye1qgY6KbAJ+54p/SSOfy7J9EVqmgsdNZCcYZ4Ks+5DWK4Vs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4B2F62DBB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507210164
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE2NCBTYWx0ZWRfX7Vg0/n/wflI8
 wR+NAdvWlXk3pU2dxiFq5BSAg+wqKjQjYFhRBg5ebw/ktzdaOkjrz2OFmX4eQPSrh2hqkdTQuy2
 JcG9FZ2O/BP+MQQFk5XrUdLqVTjuxCiAmDlAIu0JutbLFBExjT700SC2BkMMyBnl+enH86yzoZw
 xSh7JA5abqSKi5ewrZbIAXoVY25z6OpY4D9aa9ZzskTs3T5vmb9ELxi0O7a6cM7S2SbXPYRv6GZ
 iqBm1M2CGoBOTQnlVxTd6j6PE1AvoTizXiq0rrwH0VvF2U1iZPs47X130qTDpGl1TnCA8USMDgT
 eKtP0wTra0s4jL+4R9vT4XJy9xv9EiJp3UQGBYicERcxHsJCwMIMmoKFSIX0A6erYD3S3SVdzMt
 74EzedmU/01FjEIQl1CORbNJnE+gD6vAj2bRDLRmGYqfP7qexddabS5aZSrKDna/6HciFjYi
X-Proofpoint-GUID: XwEoRAB_9wxO6NZqntzPKn3lLv-qEhef
X-Authority-Analysis: v=2.4 cv=IsYecK/g c=1 sm=1 tr=0 ts=687e8755 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=z8KRnUJcD7l-TnPfmywA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: XwEoRAB_9wxO6NZqntzPKn3lLv-qEhef

On Mon, Jul 21, 2025 at 01:01:00PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> I guess what I mean is that I cannot think particularly of any objection,
> but what's the rationale?  Certainly, there is still a lot of /bin/sh left.

These are some that I was ble to identify tht trigger errors or unwanted
baheviour on other distributions that do not use bash as default sh. 

> On 7/21/25 09:34, Kris Van Hees wrote:
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   test/unittest/ip/tst.ipv6localicmp.r.p                  | 2 +-
> >   test/unittest/proc/tst.signals.r.p                      | 2 +-
> >   test/unittest/providers/rawfbt/tst.synthetic-entry.r.p  | 2 +-
> >   test/unittest/providers/rawfbt/tst.synthetic-return.r.p | 4 +---
> >   test/unittest/ustack/tst.ustack25_pid.r.p               | 2 +-
> >   test/unittest/vars/tst.ucaller.r.p                      | 2 +-
> >   6 files changed, 6 insertions(+), 8 deletions(-)
> >   mode change 100755 => 120000 test/unittest/providers/rawfbt/tst.synthetic-return.r.p
> > 
> > diff --git a/test/unittest/ip/tst.ipv6localicmp.r.p b/test/unittest/ip/tst.ipv6localicmp.r.p
> > index 904102ac..fd1ef30e 100755
> > --- a/test/unittest/ip/tst.ipv6localicmp.r.p
> > +++ b/test/unittest/ip/tst.ipv6localicmp.r.p
> > @@ -1,2 +1,2 @@
> > -#!/bin/sh
> > +#!/bin/bash
> >   grep -vE '^$|data bytes|bytes from|ping statistics|packets transmitted|^rtt min'
> > diff --git a/test/unittest/proc/tst.signals.r.p b/test/unittest/proc/tst.signals.r.p
> > index 7798fa25..4044a64f 100755
> > --- a/test/unittest/proc/tst.signals.r.p
> > +++ b/test/unittest/proc/tst.signals.r.p
> > @@ -1,4 +1,4 @@
> > -#!/bin/sh
> > +#!/bin/bash
> >   #
> >   # Eliminate blank lines and the monitor messages emitted by bash.
> >   # (Turning off monitor mode should quash these, but it doesn't seem
> > diff --git a/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p b/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
> > index 18171f04..59dc63b4 100755
> > --- a/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
> > +++ b/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
> > @@ -1,3 +1,3 @@
> > -#!/bin/sh
> > +#!/bin/bash
> >   uniq
> > diff --git a/test/unittest/providers/rawfbt/tst.synthetic-return.r.p b/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
> > deleted file mode 100755
> > index 18171f04..00000000
> > --- a/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
> > +++ /dev/null
> > @@ -1,3 +0,0 @@
> > -#!/bin/sh
> > -
> > -uniq
> > diff --git a/test/unittest/providers/rawfbt/tst.synthetic-return.r.p b/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
> > new file mode 120000
> > index 00000000..7ba3ffbb
> > --- /dev/null
> > +++ b/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
> > @@ -0,0 +1 @@
> > +tst.synthetic-entry.r.p
> > \ No newline at end of file
> > diff --git a/test/unittest/ustack/tst.ustack25_pid.r.p b/test/unittest/ustack/tst.ustack25_pid.r.p
> > index 6486f7ec..c0110e00 100755
> > --- a/test/unittest/ustack/tst.ustack25_pid.r.p
> > +++ b/test/unittest/ustack/tst.ustack25_pid.r.p
> > @@ -1,4 +1,4 @@
> > -#!/bin/sh
> > +#!/bin/bash
> >   # A pid entry probe places a uprobe on the first instruction of a function.
> >   # Unfortunately, this is so early in the function preamble that the function
> > diff --git a/test/unittest/vars/tst.ucaller.r.p b/test/unittest/vars/tst.ucaller.r.p
> > index 8e03f110..23255a14 100755
> > --- a/test/unittest/vars/tst.ucaller.r.p
> > +++ b/test/unittest/vars/tst.ucaller.r.p
> > @@ -1,4 +1,4 @@
> > -#!/bin/sh
> > +#!/bin/bash
> >   # A pid entry probe places a uprobe on the first instruction of a function.
> >   # Unfortunately, this is so early in the function preamble that the function
