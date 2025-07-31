Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE213595A
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 00:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753921050; cv=fail; b=Ojxt8QxkDND4naMkR8MWQhKEqqqOJjlDQWKGI/1S1usBaDneUena3hfwWFToAqjXonUCzNnm0wmf10IoyZdveg6jW+cheAQ2Fntc1pYxi5sDKMJaA8d7Yuh/GIg7Lc9jHNTe2qRruNtPgXQSBkMNT1k7t3MDzqla6T6iMQkHZ6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753921050; c=relaxed/simple;
	bh=vlcqL9OK2bSPPwPby9iFUNl6LenOBoKpLkPMved0XCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kCdUbIi52ShDCTVdOTCXrSPzmUCVwpkZbGyoxU5N9rKbcCXCFWx91S1bRJvEj6k6mAlmfDLu0IkU03BN31K7AEvPxlVz1eRzeEkrUP5QKuyXUGo61TWa1ir2+lbfclWamlAMtjyUEownjJup5m/9MN4/2O9+0r+ig8EBz02TAk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b0nlDFye; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KcczwjMz reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b0nlDFye";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KcczwjMz"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UJC5Cu010466
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 00:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=cmaenCs1IyVouz+swRJVc4Cczwzl/dimRgY2P6X6BqY=; b=
	b0nlDFyeiTd2Tja5WDOtoXLOos1K0RwfWHXbbhUo0UVTebmoOBtYTE8jRBcX0zud
	X8GUpnwIBwFodGkXW1JnwUMW5XtiHGMtEWVFlB7+vENpqzASVth2m92dxgxV1Bme
	shHh0Ds/D7v6EbjP7H1opA9VYl4Cd+u2MphwIygAd9aN5LAECf5y6trDvgMuZxNI
	aZxRLtsjI+xc/hR4I+5D9DTXu8oMcgh5xK9Eq+FDPn3QZZ0NZ1dPbKB7stqi2MoA
	AeFnApgrSeewNz4iKLWisB6uQ4aKQcQzawXEwA6kfjjLF18SW/axCXZ5xPxIDXNY
	+qxRPbpAbFqgimZgartwww==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q4eb53w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 00:17:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56V0DoAs020789
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 00:17:26 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 484nfj59rp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 00:17:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/Ns3MazgQ7DfWxONbHXezO4sq184WyzcWtXxxZfVcSOj6zz0tl+DN8+revA2D+t4gZETcsoFac0XSpSU9XTH/Rugys2jHyqGwFR7Sy1OhWucIk/yiZH+7mGOfMOlWYYHvq1XswPvo416WfvRwQ9n4NsbFuMRJ8/kluCYzB+XohzX8Q4EEGGLtYiwVqyt3cT6aLVnJLyswzLaF0vrkcn5djdw72YKSj3kE/R9CAKv7Wtj5fHn6DOaFc3CF0/ysv98p17weBPWd+vgLrENtuGjGRKOeb4R3OC5xPHo+qY8K9elRbRVllIqFvpnVIqWIexyC2OAKpP8UEW3oYyi5ZX5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//5dpeO1eJOOr2JuBOvx1iHVWQGqIbmY5VXBqfnzI3M=;
 b=cuRcGER2yBikdaFlO1zfotdOwBAOMauNmIaK+gar1hDhI8YQRIQ1kfKVtcjD06jr9ivyDXIh1SFc15c28Yi1F8ar9fX7RHoQAmnUAPQSh+ov5IA9mLLIO+AWPU/PQi/Q/sW0vEN9vrKWdkSav0zLz0ZYK714RGXiUr9wmLgnWmp/w6Do75eT+iy7umtehcssjkxXkscfEq8tiG7FrOs0cQ8xuHx+F/ivbcG+ysq0fYVaC9imCGAhCFIO8tOoac6xN4cH8dnUnPf2+6M6D+X46YKNEyLxLr9KGjp01SVc9h63ytHh/2IoD2VyS+CybekUsrC4xwWZ8WxkwZjnWzYtFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//5dpeO1eJOOr2JuBOvx1iHVWQGqIbmY5VXBqfnzI3M=;
 b=KcczwjMzwe9Fmu+/dHEjt/XJ0d88BHPJLV+LgmzXO5ckp14Sjlz2MX4dLgNhUGcqIY6dJkLdMIrs+sUmQfFWYosCTnCWlmDhzZ1/4vD1vYk27HmDJQjikwQzDsrmko0LOJpgiR2Fhwmm9RZzjfQxmi1oY2QlHzgczJBYyp/fOYU=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SA1PR10MB7738.namprd10.prod.outlook.com (2603:10b6:806:3ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Thu, 31 Jul
 2025 00:17:24 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8964.023; Thu, 31 Jul 2025
 00:17:23 +0000
Date: Wed, 30 Jul 2025 20:17:20 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2] test: Wait for output to flush out in
 enable_pid
Message-ID: <aIq2EH3eozcdOpYl@oracle.com>
References: <20250628223050.3396-1-eugene.loh@oracle.com>
 <aIopqYJP3yn8DzUf@oracle.com>
 <aIorqcS0sGZ0UuHS@oracle.com>
 <251f2ae1-a884-4a97-49e0-c0fb419a92f3@oracle.com>
 <aIqfNKgdHaS6R6Nz@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aIqfNKgdHaS6R6Nz@oracle.com>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SA1PR10MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0045bc-113c-4e31-3c47-08ddcfc79f6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?FXUJYV7x3CtEHnwq8+A19x1og45puY8uwGglLyr5Lr4LqC3uJXOPrBnZdi?=
 =?iso-8859-1?Q?w7vNmuG6hVESZXOlxM/8jAVeG5fdwlPoY2mKgVSaf1v8YWDuCbvYwXYF40?=
 =?iso-8859-1?Q?X/7Lc/NOn/VZYrykMgyQeMdNuz4f7yQ8frBIxzbuYswuBs6GpMPmW9GuE1?=
 =?iso-8859-1?Q?bc6r3YPkKe42n1N+sal5d7QOmc21m6Tj+l0Kr7DwKP5oZNi1yuB/cAtyWD?=
 =?iso-8859-1?Q?0C83VtX9+9SfM5awQ2XbEEpM/U2XZoNJaVQ9BWfmlATDbzUmfM21iv5hw0?=
 =?iso-8859-1?Q?tKZ5vMgqlWuH8kX6Xobc573WKnv90PHgjb5o7VrUnPAhzJpoAuOUXkBbHC?=
 =?iso-8859-1?Q?hvwFvKtomrAhUoJo8xcV+o+iemcRMall3LiIeGoQpSQjpPP8jcl1MQyIvH?=
 =?iso-8859-1?Q?3z/yRkoxForA8PZQXW1FwF7h0pqyPsqR4FUJr8Q0W1L9DBaZELp8D24gyr?=
 =?iso-8859-1?Q?8A/CnmgFTUPhp9F/V3RVTtmQjjHTZaZLbBQvOx83Zjmrzi51Ti3gbrC0EC?=
 =?iso-8859-1?Q?vEN3bRX3AUjbNQdKXdEyPN5swEOCTbdcnE0qRjOuSIbNkeliMH5W+yO5fg?=
 =?iso-8859-1?Q?L0tDfgGUGVvmc+U5iVNsf5/O5b8GqCrtW3xdmX+PGoeUVXuqfQ0AklvpAZ?=
 =?iso-8859-1?Q?oPSurZNCX3vKxXBG3CdieQW3ThEVu5VNzeetyvhFtafGCYmLql/DFF9nQs?=
 =?iso-8859-1?Q?zzSdlHYaQHIRmM951IFCKSRRl+UL/ZLlgY9RjEX4b7dlQyItxIbKwN5bWj?=
 =?iso-8859-1?Q?Z0Ir9O5VRlF5JLMh+y8wK1K3O4FgUSPbKVdv4HrgP9lvdpaNsBL+25szzQ?=
 =?iso-8859-1?Q?Wjtb3k2WPCfREQqTHECsmSqxmVe/xs3c1U0TOwEQHhr4zPw1nj/8o0D0xr?=
 =?iso-8859-1?Q?SSHre6k1UmcRhhxOA/0XILKciMVvHSW5LoOU7xTito0uhwG7YPJ7UQX4v8?=
 =?iso-8859-1?Q?owuY3CYv9QsTQMSV7nUs9WdI1jJvMd54d9d9HH2o1phM14Q4JM9IwR8yi0?=
 =?iso-8859-1?Q?uWMrm+qYykc24+ODILVW9KxO8AXcunbV3ksNvidnjC2BVzk7lr1HrwCD62?=
 =?iso-8859-1?Q?yauRjQoMgXmkm8VMP5/7OK8r5d9y57z79TU98/Ek/eklzxsIn+xpWydNub?=
 =?iso-8859-1?Q?y+Kts0EPVVCeclazLIk62GVoo6y8+wv6tvoJDXCmf0echUjyzSLTorXVwq?=
 =?iso-8859-1?Q?4VXLhj3rjPKq+XBAHOt0NJGP7zbkyg0O2jO2cV3rcb6uSThi9Qy0e2BvZs?=
 =?iso-8859-1?Q?kxWrZI5lxhqo/R3IfeLA6iDUNPlCtecFUc/t4qc9ArvyqPou8znNVsSbuT?=
 =?iso-8859-1?Q?T+6O0OyPNH8APU2JnOCxw5pySWqqt07zjpraJYtx54yNqjauBf/z5FfqGS?=
 =?iso-8859-1?Q?cnKIRosXMe4BJX7shXfqw5Uh1OttztJAMRRwfOyoVMNbUUR8fFB3OpPlRH?=
 =?iso-8859-1?Q?h3q6dbE8kbyDopdpY1FZwAFs02SqKRRd6wjAwQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?St8u54ajAJE3mSI3q43kS6TVNjUAVF1bMSN9VYfzjkCL+kiJUvjh94hOup?=
 =?iso-8859-1?Q?bVRd7JaPFXoPjl36ZrQbrSpNt9SiG4wE9T+13Vifo5hvM4BXGfqUJkE8Pp?=
 =?iso-8859-1?Q?QlaieR4zNS5LShHcQQ2y0U1+Q4vzA9Z+rXlER4Fg+9GoL1dtUtuNC6MSdz?=
 =?iso-8859-1?Q?b+j3CEcUupMYrJPqzrHsM+vMJKP7jgh7RgN+30F/gjrxh3W1U0Z7libDJO?=
 =?iso-8859-1?Q?9UXdbC2mZU0ylIbeN2VNhyrbSKn8PWhPq+0GQPXNZ810HFwQNw66doEr2G?=
 =?iso-8859-1?Q?IpIYsLmiG9P0t1xy1mUkOvFCV67RLwEo17cKz9ZIlSEN6PT4kX1Q3XameA?=
 =?iso-8859-1?Q?NsDYJpjwshF0ugRSWf8mWgCLQqqFLZkdjOqdx7iMla+UmRhSvRN8V8gK6U?=
 =?iso-8859-1?Q?NcFUv0K1EgvMXenANaI4RHYIW1gA35RrPoMn+iHk5vLxtPExwxebZuTR6O?=
 =?iso-8859-1?Q?TIPDDEM49M2NPpocOL7zxb9Q3TznskIZfPIUbXI2XmewBggaO90SF6gvzv?=
 =?iso-8859-1?Q?AgBUZnWw0vnJt1DqHxuoR3ep4TQFIto3LZl75TbvJuo2Uoyg3PT28/ybit?=
 =?iso-8859-1?Q?vX27raB4WOOyF/ZLotheWdFuSLb4ACAQeeXS9WvyUTzBU/Ulk1sxsTRYhZ?=
 =?iso-8859-1?Q?wjfiLZ9+gvMHw7tG+KL0T+EjvhiOrESQPGu2yzSGdKhHotqLHDfpaFrvnK?=
 =?iso-8859-1?Q?HAbRtD6jczyOsWTWUwZALumwMPIeuS6Cq1Um443lfeLcIJrYmvG/4xli4u?=
 =?iso-8859-1?Q?dPAnavgbp0Ix7DIiOwUaBkwVZk8uhW6x4iXVs01IOHVXOnJg7wzzsMs9OP?=
 =?iso-8859-1?Q?/cP/y4SN/cVyJtOXXo1xAjTTly5O/bB+toWi7A1vOvU06K/nkjH9pafjex?=
 =?iso-8859-1?Q?myazzMn77x37+22/9fdHT9DNbFMdZyqTnQBadc4Ei1gYAQtWDj22Skkn1R?=
 =?iso-8859-1?Q?ttYT9zXsyPefMDB4Ya5D1fU+L82Ul30OL6KE5SzzF753FhfY2+25+kKx1T?=
 =?iso-8859-1?Q?fGx1DSdPF2FN8oOwU7nlnAjuKlXJfX1JVbDknHUyjTPXbaoBXqeSWY5Z76?=
 =?iso-8859-1?Q?FF9roppXONewCRhhCg2QPuGJCGEeYgPR4GW1UbpdUvVxIT0YLwW9+XWN+B?=
 =?iso-8859-1?Q?hmDxxhxfXuS8RM6bw/iDe5jJnEt0w+d5J6Iuc2XnH+pIz+fqOyZa1J8InU?=
 =?iso-8859-1?Q?VURefUp9W/XP9KNmwprj6z51rwVR74aLzDAajqkKVtd1u07awd0Re0ufu+?=
 =?iso-8859-1?Q?ZdiJ8BjfnpXQc3s6WMTftXGe83Ty8MkVrOh6uYsEfgAc0trPCape8h2wq9?=
 =?iso-8859-1?Q?UlyjUrhwKfxw2FHtJLasE/Pno2KbNJmW/mtjzToQiGVLXtC7MD0VNOWFgu?=
 =?iso-8859-1?Q?PMnfRbrRWpMFhhgCcRHGL/QkJ9KHdOmGpDDsEkmXaWwER7XNaKOy7/UIzd?=
 =?iso-8859-1?Q?8+K6zxslC6dN64kMLB5VTjusg8B/Ql/YDw7z7rKOR6a9CwE4mOie88c0zB?=
 =?iso-8859-1?Q?NuVeJOb1QhpW7KVGUpu4jAwMw3YvymuqNM6HLIGbq1HiZRJBd813X1M2bg?=
 =?iso-8859-1?Q?mjLY7Y0AXqI9wVMGAmrMqG0+t0XjqBPifY/RqzYuiCNY2RI+I9YyB7/CDO?=
 =?iso-8859-1?Q?g5h8NoSyu57JUeY3X9/Tj55udIuET3zMeYsGWb3pE66esTVcuHS0ouLQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DIYPOFr+T/jnYnPZkkvEnFWROYlVJNf+10vjn39bq4bUeoUxcle1ICJgNdFgq5N/RyZlStwmxnUEKfRkyPyvbR1i0xkiculFepS18oollCuuCD9bLBSwMvO9ImnU4a83GrLG17S4Bu9BnlqpJzrEKDrDWhaAinCYb0wDxz+V9GdzX0UCMRa4m8ynZe+e65mAXaw14FcgF/OCJyikHA2sAWkkGR4Vb2u+Wr7RyLLZ90iBa1qkLPmknN5fIbBFCSeO+GrN/l6mDVBUy3/rA7AL/3u6J/i1Y/HfLHQmiJqadLUS+pW4ZEiffiWYratszGIKtf/Z5MISAjBYZm97VKSdF5DvnZzMQ7wblecyrw8Vnqj0xw8wRT1nJOrHA4zkxaOtwqc2bGRpA4f6l6PCULAAQUXioYJ9n1S/gKcrbSRrE6IPTzRGPy955Peh+qmag+H7lwlkGRuGQycUPDPt2GT16jydND3jSIeM0Bhe+bVUnFbhLaWTV7hGS8xo70ScSA4lL8cxZzc8YBDznPt0MwLxjku8DEDTyIHZ+oINL3t5Ocp8O3F0TBsO0rG158liCAkPqt8qNjvg47sxIwmRVs9N6AJetsFqE6RSTz7WMiVfG2U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0045bc-113c-4e31-3c47-08ddcfc79f6c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 00:17:23.8354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jc2jbildVjligJ9vIhWyCjr/H1cmBib9pddUNuSm0yN8b50NE+zUF0GTbOtVUh6GRFQggOt8G4QzmjWtCYJd76hosj533E+ZAImYdIvZElM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7738
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_06,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507310000
X-Proofpoint-ORIG-GUID: EDdNbz-uwUBVSvhkL52Ds26zdsIXs7Bt
X-Proofpoint-GUID: EDdNbz-uwUBVSvhkL52Ds26zdsIXs7Bt
X-Authority-Analysis: v=2.4 cv=QZtmvtbv c=1 sm=1 tr=0 ts=688ab618 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=ZCx2d43kIs7Mky4-g0UA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:12071
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDAwMCBTYWx0ZWRfX5D058a5k0i5E
 nhcd1U9j1+i14rv7Avz4Va8iYRtMo7dp8Q92lO02X570JAIlcXszVqHtBoMp+8wODzpCg9OCh6c
 zcwyenVRYkcT4XxD5PrFR70a4ON4W8tZNuBdobM2VotRqRe8VAu/FlPMp9qz19WUtCT7TJ0IFoV
 fGzY5eh5K8T/H/pDYuRumpNHnMqUDakuAODbW7We9BAi2pXUhpOFplRH6XPardqQ+01xkgnwf3s
 sZHmu6Lrxqv72drKsIfMhfCCyZnH9KFex43AG0pDaVTHyamjc/aD2QrYq+EB1Q3ozBWsqVqvVAa
 SO5X4oSqsHAFaNgGvzUmjnr+GC2ITS8polz+dQPB7jHXUfMkJh7K+fqo5vJMFWec3OInVqpAOhh
 wckodZc3tFG7jt1Xg5cNhpzFWnnlaYDclTcv9yiFHpAYUyyfvgjuyFxKYT5GNCMxU2l24DJt

On Wed, Jul 30, 2025 at 06:39:48PM -0400, Kris Van Hees wrote:
> On Wed, Jul 30, 2025 at 06:03:39PM -0400, Eugene Loh wrote:
> > On 7/30/25 10:26, Kris Van Hees wrote:
> > 
> > > On Wed, Jul 30, 2025 at 10:18:17AM -0400, Kris Van Hees via DTrace-devel wrote:
> > > > I still see intermittent FAILs.  I wonder whether there is a potentially unsafe
> > > > contruct at work (see below).
> > > Hm, no that does not fix it either.
> > > 
> > > Eugene - can you have a closer look at this and see what might be going on?
> > 
> > I ran 40x on each of my 11 test VMs and am unable to get a FAIL with this
> > patch.  I took a look at the test some more, but without a failure it's hard
> > to fix.
> > 
> > Are you saying there is missing output (the motivating problem) or that
> > there is a timeout (I thought you may have said this, but I cannot find
> > where)?  Those would seem to be two separate problems, the latter being that
> > a trigger does not see 4 signals.
> 
> Here is the issue:
> 
> Diff against expected:
> --- test/unittest/usdt/tst.enable_pid.r 2025-06-08 00:17:54.789469056 -0400
> +++ /tmp/runtest.18085/test.out 2025-07-30 10:23:48.697293799 -0400
> @@ -22,8 +22,6 @@
>  === epoch ===
>  is not enabled
>  is enabled
> -is not enabled
> -=== epoch ===
>  ========== out 2
>  is not enabled
>  === epoch ===

I ran it 100 times, and got 26 failures.

OL9 - 5.15.0-304.171.4.1.el9uek.x86_64
