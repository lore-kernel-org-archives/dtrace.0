Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E662566E9
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 20:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758142720; cv=fail; b=LDTckCjLmkLCaU99LCqprAWjRU2j3Qv6nNsjcuE0ne6UsbhFkbvEo2ytgpIMgtAZw2XIH+6cYIpi8HeKw2rlQ8EgzgVJzyp1ktlK6NoKeJI8k3dxS3YifCa2CHcogQ69TMu5CV65AkjuptDjqv1wXK9es6QbtmP3tfPq3+AZwKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758142720; c=relaxed/simple;
	bh=561U90FlPACtmDoPKB8e3sKckIDJFgVUhT3XPM3SsN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Zi4W8qAvcOz9DIQISrnRenJsKPHlHVHjZKrxMdxJUnxxRNkloXhk6X8qKcjQ5BP9UHrIYVj/o1Q5QuRVktfe6cAIFYTnCw+C8IjJr8f5VxZlfS3Q8cfB3+Br5TET3sixNVC0+HRDOkoGVT2LI8Ew5BBAYrqpl48dnmx9bNQCfY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=o/0GCdsh; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qhF3r1RE reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="o/0GCdsh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qhF3r1RE"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HEIUTF031300
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 20:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=wC0asS3AgrHZsNzyBB4zt51y+v0KYeiKv4djZiuPRu8=; b=
	o/0GCdshxDMriIKFhJewgQqAGkfmlV0ew+RSuveMCREb/YtLLj2gmdqsA1RmVjwk
	QLOLS5meZ9E4nurDFcRam2XEtQbgQPi5cjNvxBFkgT+eFn2EdmkqOOguyclSNvMP
	CF8ICyl2VBwXWQZv4H3e4kHo5VRbGSlkQ7bwOkXoPnsKH/OzOtu/R4Foh5GaMZs5
	mr0Q3LuZYZb4rnkV0CPoUMSvmn9rUKC7uEkyulfNF7RC/A3VavmhYaS69kakMPgt
	cqPQSH3LIQn9g+KMxbbK6WafRdZwX17q0v66li3RN4sMlOPwn9cz1uSZrQB5iquM
	tRAwlrTOSZB5SIepBnIs+A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fxb279h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 20:58:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58HKGubY028746
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 20:58:36 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012047.outbound.protection.outlook.com [40.107.200.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2e8px9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 20:58:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUmwJAVwqOmZCM7HptTsX6U0SUOGmPay1qOFo19hGt0hGS8r2+CDENqqGk5DBuQ5Wm4stxFahuxFrAMx1TQlZQr6VyKAN5YXwcYzVUIE68YMm6QIGL2zVTnYAfKhT9MsZvUPFvMIk1RNYyv3A8ywvg8mtmXLOlMpvcz7h1BtKwzfCvCMRBM3HL/BXwYTZUrAiWivieyOZFBaBld4VgO5bsE9Qq/ExAu3bxGQX5QaiXxvi1tnPzxJtd9wzp3mkrXNeMt79qiSIuxHb3ps/SjURNFFOjUso4cnZ6wpYqAp9ZKcfFw5bvGU6tHp5Aug7wQKPdzXNalX1bB6hQjueePNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MtDRCMcBHu+lnXVXTBcVLuSnwbHJHQ8mvwmpjOzmWw=;
 b=CVzGX1LDsbdlV2vrHKA8b1e7zyM6ZrNaUP0E7xneS2In8+Jbk07caE44BsZE2KJsGz0CDyVoCzC+bT2f0qYc2mJ/WuZpWtA2ef7G3ocBLg8zjE0e38P0abplODiwMegVOTDkQbc64XgDvNsGMXoKc+AOX5SylztLg3/+rE6RlTLQ31dOX/zPW3FTRpi6sJuHJCaUdkfJDA0hJFQDGIU0cXQDk/RpzYV6kejCEAtC4oYK4vjx1rufgtnZGtlSvvl/Hh8LPM4o1GN1Sbuv25/wBEm5eX/JnjH9lLqzonwdsei/cjccIHVYgg9S5xEdL9yZ95aIjQQq7XlRYqmo6YFH8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MtDRCMcBHu+lnXVXTBcVLuSnwbHJHQ8mvwmpjOzmWw=;
 b=qhF3r1REd68YGgVR9vWFkX1R36+OX0G/pphx5Sk6kL6U/gUKpSybFrGariPDu4Fc7u5YFS/GkZ8jd5Y77Hd7kKXL/WK8bdPGfyFMQIdp5PfMsCtw1s++Tv3qqgic9GJlPgPqjcWR7qEoYu8SObT8/w3A2fk+PCQk0GP/9RoRgGg=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ1PR10MB5907.namprd10.prod.outlook.com (2603:10b6:a03:48a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 20:58:32 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 20:58:31 +0000
Date: Wed, 17 Sep 2025 16:58:28 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Allow probes not to attach if they were not "needed"
Message-ID: <aMsg9K2h41eknPRD@oracle.com>
References: <20250904190226.31242-1-eugene.loh@oracle.com>
 <aMrzOJRUSYNzBGIv@oracle.com>
 <040a1b97-d03f-4ed8-3275-27d49b651b44@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <040a1b97-d03f-4ed8-3275-27d49b651b44@oracle.com>
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ1PR10MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d5f19db-a9e8-4532-8653-08ddf62cf583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?pATdLMq5Z6q1q0qkva63BcqoIGCKiPCyxVbVkUrNijFyKcDUBJKZsugXoj?=
 =?iso-8859-1?Q?T4yQUTbIUSqw2dRMI9icPOeESPtfCCmOjbVvUhSqL2PDGpJiRSyaQVWZZJ?=
 =?iso-8859-1?Q?8e8k6vb9Oxq4lYwjzhIQD0DEQFoqLYG7JxIWjapJU3l+slHQKbz5oJuHCw?=
 =?iso-8859-1?Q?5eyUCx/1euVJcAaODrkttNj3S8YRow9MEkNvrWxk7zvH1iLTWNO1CSK2Zq?=
 =?iso-8859-1?Q?EZt3UzYdfwlr1Xo15pPHmezvoMTZXpk/pkhMxEGgid52hKwaOKpv6co/B7?=
 =?iso-8859-1?Q?8c6PvKilbUyQPRvYgbkyLnxlAgvmliQHMAY6hTrqJyF8A2h+Lx6CjI1jeF?=
 =?iso-8859-1?Q?AjOvpv3usHsqcVKmnanh6QDUuUecYNmeQaT2IZzvC9+UhEzmJD+FXolfUW?=
 =?iso-8859-1?Q?4ktTfmQXRW2nlvcoDkFmTmVJyywEIFOYFpg6fv+CS7ckUVmLct+uhMeHU+?=
 =?iso-8859-1?Q?8pP2Iazg4KmuLqa5PRePvtNzYWkytrv9Gn2eok9qS5h0nMY66pKaVLXJrp?=
 =?iso-8859-1?Q?V/xms5AOpV1PU1zSkB3qmaq8KQjDH9ySwZchTwd3jKr5ictDjr4FXsC7NR?=
 =?iso-8859-1?Q?jfvMVT9tc2rZzmia7j96k+UJpL7dtMXtKy1MrkFwodKKcKVvnb+RB7Zc1R?=
 =?iso-8859-1?Q?ouBZbM1pkvIL0ADxtUYffpCNzrJhgMUzFadBb/om7edqv7lNzLmEg5S9D4?=
 =?iso-8859-1?Q?XFBPrgMwF9jp41hk3pkZup3Djning7ktRptnD82O9ETqqwWT/xXLayN18B?=
 =?iso-8859-1?Q?E9gwhBHwBKzganMSBfDKmBgHV3+lMUL4Lt0fArvg+sQF6UPHABRQcl3+Ce?=
 =?iso-8859-1?Q?1P+ASieMRkVlTsKLkL8zHfI3Ynu/FKkSU5qdE2todqyOQUpr5EwXv/Tahd?=
 =?iso-8859-1?Q?I6O6hpn4VQhBAi4Y4R9F0ON2ss9YdErCZF2BWAX0Uh1egFcviyDXgsInbV?=
 =?iso-8859-1?Q?8P6YU2RfyDln9dBRWh8kF+jH/Ze6AHtMW2DxJZIgp1zlm9BvQxL3PpB4Cb?=
 =?iso-8859-1?Q?IjXRR8kxbLQvf9tZds6W56/Tqif1T85Vc/uJIJ4rw4IzNJg8UScEODYyXV?=
 =?iso-8859-1?Q?qpIU4Rv+A2i4WS1weJ2vL8qTmWn3GM7VBoAivM+hLO6JK9HDB7XaVNSqnY?=
 =?iso-8859-1?Q?70BymOJPoJx5urhvh1NgFUIK3BKQPl+c7VW0Zv9KxZoB26QCvDx0gX6cMu?=
 =?iso-8859-1?Q?x8P/tF+13AHAExxYQn7Tpev//V9w3q9Exk5mn7oM9r7JLS1o9UJwXTZ2Vk?=
 =?iso-8859-1?Q?PzWJuxhiRSoNyKfpWKYk5vbbClbRGehR5thfnXDlgEije2DG/q0cbHumgr?=
 =?iso-8859-1?Q?0kdu2VRdVSjzcrkenc/AMnepo/bYmzbm/Ml3DNyYABs5bcIQwzJOjktPXL?=
 =?iso-8859-1?Q?HJG1nLVDGE3luVRGWsMeMU8qeIcLp4dZ8Tw2xSIaE7CE7dJv6766lyJKmQ?=
 =?iso-8859-1?Q?cRJZM4Li+rIr+jxlzSZ4oMdCgVRfq/ixqQvLYLnEyDFyl3jmh71LSQxIyr?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?w8BR/BvXQyKjohqZobotiC2oDw2SulJGpsfwpWUUOf8bfjWg9yvL0ItkTI?=
 =?iso-8859-1?Q?FckAUQ/IgcK/OReI2yX3UxePd4qv4mAd1kyhhLGUbNTYBOV4A6CjRULEmb?=
 =?iso-8859-1?Q?teyO8oKLsuUbnonOoWnWciHZgGgoG1zjrPeNvvkDgF8oZBOm7kKUGLO7Xt?=
 =?iso-8859-1?Q?UtrSNh41iKs3oKsaeWI8VyFdKMq/m3a2Q+BACN6XQzRjTtYttceDPIKruZ?=
 =?iso-8859-1?Q?CohzLbGgr0IJAhff6Lcv2bY5LTeTexw31l3D18aTBAt35IphdsYVr7CRtL?=
 =?iso-8859-1?Q?DEdO6Iujg5tokvaOQB5ya/RGZ4q7fF7FITCMmkpgaWRITc0UMuHAF66F7K?=
 =?iso-8859-1?Q?3duzcI0cCDpcoxjGYR6hM6DlOK0MDxsvT8elvMxfnD/ekSx/mOmStHwLkO?=
 =?iso-8859-1?Q?OJl7Ky3LBzl0P0rknVzBNsdAiB9P/vejjvyskIV3A9jAAZB+3ow5GK6xFp?=
 =?iso-8859-1?Q?3gN2JYtUzNqLpbHAG85kM5tS/6uIp17TdkOfpKLjV2/sDndwm/ztNkhP6T?=
 =?iso-8859-1?Q?piUk8SXhHpPs4I90A8ur7id7apIrRc0KAPZFMZMAktcGPtS4OW8nVAsT37?=
 =?iso-8859-1?Q?WBTkS/B7YiKvsHhcIMufwXd3YJ4dN3XR/+TwjBB/yutmJexp0NauL8LMpS?=
 =?iso-8859-1?Q?TffTvnB/DrM0Trz0Nnm7II5bFfrJY6do/0HGHQf/yxSEUsxInRRSU7b90O?=
 =?iso-8859-1?Q?w+8LDlvaqTUClAxlPxQHCF9yVBf71bdMIuzzGfuwci06H7GuqlMbEh/KJy?=
 =?iso-8859-1?Q?WgeBeAdUTZRvwydjVGBByyAyWCXLUMVd+J11LNwbCXr6c4dQ7C5UqtaaFV?=
 =?iso-8859-1?Q?RXmkcbWUIJF4UdCjkPFFNwAO8Ujdfb10tsrWCqF5G3lRV9+VaQ7Zrvs++V?=
 =?iso-8859-1?Q?jKP7PzFV25nV4lTFXfkMHphSKxkkFRglVcay8mA2cbYW4LWflbcYIqZ3R5?=
 =?iso-8859-1?Q?85GZ10a92tMsWh3j3CVcPD3Rkw7AbWC8pi9qPSU45HqKuFK0wf5jIt8LAe?=
 =?iso-8859-1?Q?5coOHd9rHdRtIu8Wp6LQMiKKoh3lJQ7i0wTJl+qOOTCw4niiJAOyc5JuUI?=
 =?iso-8859-1?Q?io9kG5wpNb/TUD62uUHTjPQKuBOhP54TNtwl9ao27EmCPhAGV2AnJPQk/p?=
 =?iso-8859-1?Q?0rtnbDkJlPdSzwXAI3qdcw++ltbqBuVO4Hd3GqGAw6cYUL+9CE4uLeM6WL?=
 =?iso-8859-1?Q?u+j/naCSbwqjFisO/VTvMrAatHItVAIuPsMAFyyrW4VbWxu2gFExIs17WO?=
 =?iso-8859-1?Q?tZCQL869lYyQ2uNbqmgRWMpzJDpjBJF4S1YSjU0JU6Nwc3NkuVgN6XqHLH?=
 =?iso-8859-1?Q?Ss/XqcrKJeX51c3NTU8P7J8pY9bXFlZLvLO7JQaJnhDlvIMUzxWb+1jefS?=
 =?iso-8859-1?Q?4GD+tW15STt/WsLnwa1yfyjXpyIcSY4aTbAAXq61gQptYCAJjZuj3jbyuY?=
 =?iso-8859-1?Q?wPf4BAW1gTkgQ+UekkHt6EB8J3F1XiMZ1Mv94EyrLvifYW7wan+wdPqT4S?=
 =?iso-8859-1?Q?iTkXk5QTZmC77NEOoYHMedHKe2X3haO71eq0TSJFBnHo1FuZ0jXqSeipkr?=
 =?iso-8859-1?Q?xSR3GmVneF8QTbV7Z8pkRnL4W30DzOE4TFGyncm+fOSfaZ8ATJW2EjMCL+?=
 =?iso-8859-1?Q?xIqr9ilqRctQjI/ZYXb6pL5o6SQDOXVoG9TVQilsv5wGmvgs7DB/ENoA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jmOCo8y3J6iGJR42KIbHo6hRnNwkscfKxTWgEQ/7rOB7AWAEjwsb/Yg2kqNmJQBtDx5tbhDKkT6SyNTBN26nkWtu9n4JaUJO5DdPp3Rz1JHEYGFu5uybKCDFOsYmkhGvUOrLMHcpoXLxIlM6uAyMxe3RCLPZLEW4gtC3YlLnMjIk2HNgKTUeqcFe+HVHHQPxWSw2cMo3+i0Qxf39AypoKAtKAG39Lb+7e9OncJObe3782v8q6NNeWNhCPVRo1cTQAJYTOW6UXqbI1hMRvJ3ZItjsBxVbj/cQF8+7rqR73v5UJu0qPF1WmL9+h5O4PXowJ2Ns+viq9kOMOWnRCcaB91S/0qfrChVAPwlWUGMbg6ZhxXIn7ShAl+Kavv3iqAUg62eE7cfZRnP8Mrofvxg4iLUJahK+HmeHKqGNFD9i4Wr4RdUM+yFBJQ2L4ZdNQJS85eEnlegRa8tCwAKIF5K1zo+BEJiD6GlHUrH8vB3fkI2LbgSfwxsuG4g3p4wWIjx/TPcut8TRTd8RKlnSoDTu1/YC9zSvHraQZBsv3zikOFJBRy3KBZ1POpP0ashKtdcG1/41g/gXIhSKC0O4xJ5ltm1Dee9UPC3y6cE7ijJ/9iE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5f19db-a9e8-4532-8653-08ddf62cf583
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 20:58:31.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVTRunJvoZn9f5fRJK74ez2yfUoYajEKjs36yZVkp1/6rdRCx12wbUkxxnrx87IB/6DQAlVYQy2KTgr2BIiEErtnLVcKvCYHSSswatlLrD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5907
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509170203
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX8F0cec2ymiOF
 0tKgCp/tM4qDAXtv0fcJNlgYTiB1NgtXxqJQfN/9XuMc7WbJFHjRSLFfzx5MIxXtfr+X2x8oFh5
 sUTy0/ZSTHc5ucbd7uLstepjvZXxdMP1lZlpeAh/vxtSTBxGR4xgoUS1OfzuJR0FgCZeCKCCW4A
 FvMRODVsJC+MS0CTOvQVQgD5iXixUyUcDrAW9Gc8CSl4E+VdlfRYZEPf4g305IwLWR5Hsk+edpZ
 KHUwpZC6SiCHOIQlfyWeK+ePnOR1kTmfu8iwCIyW0Glg2eFkvL0ydkfcZYjMBhdkIgUf4HYb/9W
 yM5dCERIOqAo2vnuqreEn3WKuaOZF2JflyP79yf6vwtT+/EYm2TkmZDrj5g7b+lrMGI38A+ujd8
 RIgzYcLy
X-Authority-Analysis: v=2.4 cv=KOJaDEFo c=1 sm=1 tr=0 ts=68cb20fd cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=mJyVdKuwy1mpQMmB:21 a=xqWC_Br6kY4A:10
 a=8nJEP1OIZ-IA:10 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=eGERgv84-E3SkTarlYQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: hcigb0Vk_ianiHHSHUHevNEb5eS_n_XB
X-Proofpoint-ORIG-GUID: hcigb0Vk_ianiHHSHUHevNEb5eS_n_XB

I am fine not doing two lists, and using a flag, but then I still believe the
flag should be about marking the probe optional rather than needed.  A probe
attach failure being non-fatal is actually not normal behaviour, but rather an
internal aspect of the implementation.  E.g. we do this with underlying probes
for SDT probes where we may have multiple probes listed that can feed us the
info we need, and we don't mind if some fail to attach.  Your example of the
wildcard instruction offset probes is another.

But all those cases are "known" in the code and thus we can mark probes as
optional when these cases occur.  Any other case that adds one of these probes
to the list of probes to enable (attach to) would require the probe to be able
to attach and else we falg an error.

If a probe is being added and attachment can be optional, we need to check
of the probe is already listed.  If it is, and it is not optional, then we do
not mark it optional.

If a probe is being added and attachment can be optional, we need to check
of the probe is already listed.  If it is, and it is optional, then we do not
need to mark it optional.

If a probe is being added and attachment can be optional, we need to check
of the probe is already listed.  If it is not listed, we add it as optional.

If a probe is being added and attachment is not optional, and the probe already
exists as optional, remove the optional flag.

If a probe is being added and attachment is not optional, and the probe already
exists and is not optional, nothing is to be done.

If a probe is being added and attachment is not optional, and the probe is not
in the list yet, just add it.

I do not see where this would go wrong.

On Wed, Sep 17, 2025 at 04:04:57PM -0400, Eugene Loh wrote:
> On 9/17/25 13:43, Kris Van Hees wrote:
> 
> > I think this is actually counter-intuitive.
> 
> I certainly agree.  And I wrestled with this a lot.
> 
> A "default" is overridden if any alternative is specified.  In the case of
> this patch, if a probe comes from two probe descriptions, one that requires
> the probe and one that does not, then the "required" case should prevail. 
> So it is not a default.  There is something non-default about needing a
> probe to attach.
> 
> Another complication is that when we walk probes based on a user-specified
> probe description, which is when we decide whether a probe will have to
> attach, we are simply "inserting" probes;  this is well before probes are
> enabled.  Probes are enabled later, when we no longer are dealing with
> user-specified probe descriptions. (If I remember correctly.)  So we have to
> mark probes well before we enable them.
> 
> I agree there is something counterintuitive going on here, but I find the
> second list of enablings to be even harder to fathom.
> 
> Further, a second list of enablings strikes me as a funny creature. Today, a
> dt_probe_t is really just a dt_list_t with a bunch of extra "probe" stuff
> hanging onto it.  That is, a dt_probe_t is an item on a single, particular
> linked list.  Clearly, we could change it so that a probe could exist on two
> different lists, but that gets disruptive.
> 
> I'm not saying that the patch is the only way of solving the underlying
> problem.  I do think, though, that having a reasonable patch that solves the
> problem and tests well is attractive, and there is no need to explore other
> solutions.  "Good enough" is good enough, and it is not worth spending time
> exploring other solutions.  There is so much to do and so little time.  I
> vote for the patch that is working and reasonable.
> 
> > In general, probes are expected
> > to be able to be attached to or else an error is to be raised.  There are
> > exceptional cases where a failure to attach should not be considered an error.
> > 
> > So, I believe that the implementation should by default expect that failure to
> > attach is an error.  Introducing a flag is certainly an option (though I would
> > expect it a flag to mark the probe as *optional*), though another approach that
> > might be worth exploring here is to introduce a 2nd list of enablings, named
> > dt_opt_enablings, and add optional probes to this list.  That way you could
> > refactor the construction and loading of programs into functions called for a
> > given probe, and just loop through the mandatory enablings first, and then the
> > optional ones.  That avoids adding a flag and also differentiates the two types
> > of enablings explicitly.
> > 
> > On Thu, Sep 04, 2025 at 03:02:26PM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > Various kernels prevent the placement of uprobes on particular
> > > instructions -- e.g., on x86 on hlt or multi-byte nops, or on aarch64 on
> > > autiasp.  This means, for example, that one cannot place a pid probe on
> > > every possible instruction.  If a user explicitly places a probe on a
> > > forbidden instruction, an error message indicates there is a problem.
> > > 
> > > On the other hand, if the user specifies a wildcard in a pid probe
> > > description, we should skip instructions where no uprobe can be placed.
> > > 
> > > The problem is that we do not find out an instruction is problematic
> > > until we try to attach, which is long after probe descriptions have been
> > > processed.  And when we walk probe descriptions, we do not have
> > > information about which kernels and instructions are problematic.
> > > 
> > > The motivating problem pertains to pid probes, but we would like
> > > a provider-agnostic solution.
> > > 
> > > Introduce a "NEEDED" probe flag.  Set the flag when a probe is explicitly
> > > needed (say, it was specifically named).  We use two such flags:
> > > 
> > > * In dt_probe.h, DT_PROBE_FLAG_NEEDED is used for the "flags"
> > >    member of dt_probe_t.
> > > 
> > > * For pid-style probes (including USDT and stapsdt), in
> > >    include/dtrace/pid.h, DT_PID_PSP_FLAG_NEEDED is used for
> > >    the pps_flags member of pid_probespec_t.
> > > 
> > > Set the "NEEDED" flag for a probe in these situations:
> > > 
> > > * In dt_tp_probe_insert(), set the flag for each probe we insert.
> > >    This covers the dtrace, fbt, rawtp, sdt, and syscall providers.
> > > 
> > > * In dt_sdt_populate(), set the flag for each probe we insert.
> > >    This covers, e.g., the io, ip, lockstat, proc, sched, and tcp
> > >    providers.
> > > 
> > > * For the cpc and profile providers, set the flag for probes created
> > >    with the "provide" functions (explicitly requested by the user)
> > >    but not with the "populate" functions (chosen by default by dtrace).
> > > 
> > > * For providers that will sit on underlying probes, set the NEEDED
> > >    flag for pid_probespec_t.  Specifically,
> > > 
> > >    * In dt_pid_per_sym(), set the NEEDED flag to cover entry,
> > >      return, and explicit offsets.  Unset the flag for glob offsets.
> > >      In dt_pid_create_usdt_probes_proc() and dt_stapsdt_parse(),
> > >      set the flag.
> > > 
> > >    * In dt_prov_uprobe(), pass the pid_probespec_t NEEDED flag
> > >      to dt_probe_t, for both the overlying and underlying probe.
> > > 
> > > In dt_bpf.c, if the return code from the attach function indicates
> > > failure, return a failure only if the probe was NEEDED.
> > > 
> > > Remove the old check on "hlt" instructions, since it was not sufficiently
> > > general for other kernels and other problematic instructions.
> > > 
> > > Existing tests that expose the problem are
> > > 
> > >      test/unittest/pid/tst.coverage.d
> > >      test/unittest/pid/tst.emptystack.d
> > >      test/unittest/pid/tst.entry_off0.sh
> > >          hlt instruction on x86
> > > 
> > >      test/unittest/pid/tst.float.d
> > >          multi-byte nop on x86 on newer platforms
> > > 
> > >      test/unittest/pid/tst.entry_off0.sh
> > >          autiasp instruction on aarch64 on newer platforms
> > >          depending on how the trigger process was built
> > > 
> > > A new test is added to check that a probe set explicitly on a
> > > problematic instruction will still lead to an error.
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > ---
> > >   include/dtrace/pid.h                   |  3 +++
> > >   libdtrace/dt_bpf.c                     |  2 +-
> > >   libdtrace/dt_pid.c                     | 10 ++++------
> > >   libdtrace/dt_probe.h                   |  3 +++
> > >   libdtrace/dt_prov_cpc.c                | 10 ++++++++--
> > >   libdtrace/dt_prov_profile.c            | 10 ++++++++--
> > >   libdtrace/dt_prov_uprobe.c             | 18 ++++++++++++++++++
> > >   libdtrace/dt_provider_sdt.c            |  8 ++++++--
> > >   libdtrace/dt_provider_tp.c             |  7 ++++++-
> > >   test/unittest/pid/err.needed.aarch64.x |  3 +++
> > >   test/unittest/pid/err.needed.sh        | 23 +++++++++++++++++++++++
> > >   test/unittest/pid/err.needed.x86_64.x  |  6 ++++++
> > >   test/unittest/pid/tst.entry_off0.sh    |  4 ++--
> > >   13 files changed, 91 insertions(+), 16 deletions(-)
> > >   create mode 100755 test/unittest/pid/err.needed.aarch64.x
> > >   create mode 100755 test/unittest/pid/err.needed.sh
> > >   create mode 100755 test/unittest/pid/err.needed.x86_64.x
> > > 
> > > diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> > > index 8ddb1167e..7829e47c0 100644
> > > --- a/include/dtrace/pid.h
> > > +++ b/include/dtrace/pid.h
> > > @@ -47,6 +47,7 @@ typedef struct pid_probespec {
> > >   	size_t pps_xargvlen;			/* (high estimate of) length of array */
> > >   	int8_t *pps_argmap;			/* mapped arg indexes */
> > >   	char *pps_sargv;			/* list of arg sources */
> > > +	int pps_flags;				/* flags */
> > >   	/*
> > >   	 * Fields below this point do not apply to underlying probes.
> > > @@ -55,4 +56,6 @@ typedef struct pid_probespec {
> > >   	uint64_t pps_nameoff;			/* offset to use for name */
> > >   } pid_probespec_t;
> > > +#define DT_PID_PSP_FLAG_NEEDED	1		/* probe is needed */
> > > +
> > >   #endif /* _DTRACE_PID_H */
> > > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > > index 31781ac9f..dc3d47f56 100644
> > > --- a/libdtrace/dt_bpf.c
> > > +++ b/libdtrace/dt_bpf.c
> > > @@ -1385,7 +1385,7 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
> > >   		if (prp->prov->impl->attach)
> > >   			rc = prp->prov->impl->attach(dtp, prp, fd);
> > > -		if (rc < 0) {
> > > +		if (rc < 0 && (prp->flags & DT_PROBE_FLAG_NEEDED)) {
> > >   			close(fd);
> > >   			dt_attach_error(dtp, rc,
> > >   					prp->desc->prv, prp->desc->mod,
> > > diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> > > index 4af9141aa..6e7fba287 100644
> > > --- a/libdtrace/dt_pid.c
> > > +++ b/libdtrace/dt_pid.c
> > > @@ -184,6 +184,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
> > >   	psp->pps_fun = (char *) func;
> > >   	psp->pps_nameoff = 0;
> > >   	psp->pps_off = symp->st_value - pp->dpp_vaddr;
> > > +	psp->pps_flags |= DT_PID_PSP_FLAG_NEEDED;
> > >   	/*
> > >   	 * The special function "-" means the probe name is an absolute
> > > @@ -386,15 +387,10 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
> > >   #define disasm(x, y) 4
> > >   #endif
> > > +		psp->pps_flags &= ~DT_PID_PSP_FLAG_NEEDED;
> > >   		for (off = 0; off < symp->st_size; off += disasm(off, &disasm_info)) {
> > >   			char offstr[32];
> > > -#if defined(__amd64)
> > > -			/* Newer kernels do not allow uprobes on "hlt" instructions. */
> > > -			if ((unsigned int)disasm_info.buffer[off] == 0xf4)
> > > -				continue;
> > > -#endif
> > > -
> > >   			snprintf(offstr, sizeof(offstr), "%lx", off);
> > >   			if (!gmatch(offstr, pp->dpp_name))
> > >   				continue;
> > > @@ -1064,6 +1060,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
> > >   			psp.pps_pid = dpr->dpr_pid;
> > >   			psp.pps_off = tp->tracepoint.addr - pmp->pr_file->first_segment->pr_vaddr;
> > >   			psp.pps_nameoff = 0;
> > > +			psp.pps_flags |= DT_PID_PSP_FLAG_NEEDED;
> > >   			if (nargv) {
> > >   				psp.pps_nargc = probe->probe.nargc;
> > > @@ -1421,6 +1418,7 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
> > >   		psp.pps_inum = pmp->pr_inum;
> > >   		psp.pps_pid = dpr->dpr_pid;
> > >   		psp.pps_nameoff = 0;
> > > +		psp.pps_flags |= DT_PID_PSP_FLAG_NEEDED;
> > >   		if (pvp->impl->provide_probe(dtp, &psp) < 0) {
> > >   			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
> > > diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
> > > index 2a78cb9ca..ffd994844 100644
> > > --- a/libdtrace/dt_probe.h
> > > +++ b/libdtrace/dt_probe.h
> > > @@ -53,10 +53,13 @@ typedef struct dt_probe {
> > >   	uint8_t *mapping;		/* translated argument mapping */
> > >   	dtrace_typeinfo_t *argv;	/* output argument types */
> > >   	int argc;			/* output argument count */
> > > +	int flags;			/* flags for the probe */
> > >   	dt_probe_instance_t *pr_inst;	/* list of functions and offsets */
> > >   	dtrace_difo_t *difo;		/* BPF probe program */
> > >   } dt_probe_t;
> > > +#define DT_PROBE_FLAG_NEEDED	1	/* probe is needed */
> > > +
> > >   extern dt_probe_t *dt_probe_lookup2(dt_provider_t *, const char *);
> > >   extern dt_probe_t *dt_probe_create(dtrace_hdl_t *, dt_ident_t *, int,
> > >       dt_node_t *, uint_t, dt_node_t *, uint_t);
> > > diff --git a/libdtrace/dt_prov_cpc.c b/libdtrace/dt_prov_cpc.c
> > > index 57b11b135..9fb165cb6 100644
> > > --- a/libdtrace/dt_prov_cpc.c
> > > +++ b/libdtrace/dt_prov_cpc.c
> > > @@ -347,6 +347,7 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
> > >   {
> > >   	dt_provider_t *prv;
> > >   	struct perf_event_attr attr;
> > > +	dt_probe_t *prp;
> > >   	prv = dt_provider_lookup(dtp, prvname);
> > >   	if (!prv)
> > > @@ -358,17 +359,22 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
> > >   		return 0;
> > >   	/* return if we already have this probe */
> > > -	if (dt_probe_lookup(dtp, pdp))
> > > +	prp = dt_probe_lookup(dtp, pdp);
> > > +	if (prp) {
> > > +		prp->flags |= DT_PROBE_FLAG_NEEDED;
> > >   		return 0;
> > > +	}
> > >   	/* check if the probe name can be decoded */
> > >   	if (decode_probename(&attr, prv, pdp->prb) == -1)
> > >   		return 0;
> > >   	/* try to add this probe */
> > > -	if (cpc_probe_insert(dtp, prv, pdp->prb) == NULL)
> > > +	prp = cpc_probe_insert(dtp, prv, pdp->prb);
> > > +	if (prp == NULL)
> > >   		return 0;
> > > +	prp->flags |= DT_PROBE_FLAG_NEEDED;
> > >   	return 1;
> > >   }
> > > diff --git a/libdtrace/dt_prov_profile.c b/libdtrace/dt_prov_profile.c
> > > index e1369ca9b..ec32ce83b 100644
> > > --- a/libdtrace/dt_prov_profile.c
> > > +++ b/libdtrace/dt_prov_profile.c
> > > @@ -160,6 +160,7 @@ static uint64_t get_period(const char *name)
> > >   static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
> > >   {
> > >   	dt_provider_t	*prv;
> > > +	dt_probe_t	*prp;
> > >   	int		kind;
> > >   	uint64_t	period;
> > > @@ -176,8 +177,11 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
> > >   		return 0;
> > >   	/* return if we already have this probe */
> > > -	if (dt_probe_lookup(dtp, pdp))
> > > +	prp = dt_probe_lookup(dtp, pdp);
> > > +	if (prp) {
> > > +		prp->flags |= DT_PROBE_FLAG_NEEDED;
> > >   		return 0;
> > > +	}
> > >   	/* get the provider - should have been created in populate() */
> > >   	prv = dt_provider_lookup(dtp, prvname);
> > > @@ -189,9 +193,11 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
> > >   		return 0;
> > >   	/* try to add this probe */
> > > -	if (profile_probe_insert(dtp, prv, pdp->prb, kind, period) == NULL)
> > > +	prp = profile_probe_insert(dtp, prv, pdp->prb, kind, period);
> > > +	if (prp == NULL)
> > >   		return 0;
> > > +	prp->flags |= DT_PROBE_FLAG_NEEDED;
> > >   	return 1;
> > >   }
> > > diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> > > index 07b26f20f..2396522ce 100644
> > > --- a/libdtrace/dt_prov_uprobe.c
> > > +++ b/libdtrace/dt_prov_uprobe.c
> > > @@ -960,6 +960,12 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
> > >   	} else
> > >   		upp = uprp->prv_data;
> > > +	/*
> > > +	 * Pass flag info from psp to uprp
> > > +	 */
> > > +	if (psp->pps_flags & DT_PID_PSP_FLAG_NEEDED)
> > > +		uprp->flags |= DT_PROBE_FLAG_NEEDED;
> > > +
> > >   	/*
> > >   	 * Only one USDT probe can correspond to each underlying probe.
> > >   	 */
> > > @@ -1049,6 +1055,12 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
> > >   	/* Look up the overlying probe. */
> > >   	prp = dt_probe_lookup(dtp, &pd);
> > >   	if (prp != NULL) {
> > > +		/*
> > > +		 * Pass flag info from psp to uprp
> > > +		 */
> > > +		if (psp->pps_flags & DT_PID_PSP_FLAG_NEEDED)
> > > +			prp->flags |= DT_PROBE_FLAG_NEEDED;
> > > +
> > >   		/*
> > >   		 * Probe already exists.  If it's already in the underlying
> > >   		 * probe's probe list, there is nothing left to do.
> > > @@ -1091,6 +1103,12 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
> > >   		return -1;
> > >   	}
> > > +	/*
> > > +	 * Pass flag info from psp to uprp
> > > +	 */
> > > +	if (psp->pps_flags & DT_PID_PSP_FLAG_NEEDED)
> > > +		prp->flags |= DT_PROBE_FLAG_NEEDED;
> > > +
> > >   	/*
> > >   	 * Add the overlying probe to the list of probes for the underlying probe.
> > >   	 */
> > > diff --git a/libdtrace/dt_provider_sdt.c b/libdtrace/dt_provider_sdt.c
> > > index 962848485..f9a51fa25 100644
> > > --- a/libdtrace/dt_provider_sdt.c
> > > +++ b/libdtrace/dt_provider_sdt.c
> > > @@ -48,10 +48,14 @@ dt_sdt_populate(dtrace_hdl_t *dtp, const char *prvname, const char *modname,
> > >   	 * entries to identify the probe names.
> > >   	 */
> > >   	for (arg = &probe_args[0]; arg->name != NULL; arg++) {
> > > +		dt_probe_t *prp;
> > > +
> > >   		if (arg->argno == 0 &&
> > > -		    dt_probe_insert(dtp, prv, prvname, modname, "", arg->name,
> > > -				    NULL))
> > > +		    (prp = dt_probe_insert(dtp, prv, prvname, modname,
> > > +					   "", arg->name, NULL))) {
> > > +			prp->flags |= DT_PROBE_FLAG_NEEDED;
> > >   			n++;
> > > +		}
> > >   	}
> > >   	return n;
> > > diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
> > > index 3d4ec1e03..4531a88a8 100644
> > > --- a/libdtrace/dt_provider_tp.c
> > > +++ b/libdtrace/dt_provider_tp.c
> > > @@ -368,12 +368,17 @@ dt_tp_probe_insert(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
> > >   		   const char *mod, const char *fun, const char *prb)
> > >   {
> > >   	tp_probe_t	*tpp;
> > > +	dt_probe_t	*prp;
> > >   	tpp = dt_tp_alloc(dtp);
> > >   	if (tpp == NULL)
> > >   		return NULL;
> > > -	return dt_probe_insert(dtp, prov, prv, mod, fun, prb, tpp);
> > > +	prp = dt_probe_insert(dtp, prov, prv, mod, fun, prb, tpp);
> > > +	if (prp)
> > > +		prp->flags |= DT_PROBE_FLAG_NEEDED;
> > > +
> > > +	return prp;
> > >   }
> > >   /*
> > > diff --git a/test/unittest/pid/err.needed.aarch64.x b/test/unittest/pid/err.needed.aarch64.x
> > > new file mode 100755
> > > index 000000000..bd5b41a36
> > > --- /dev/null
> > > +++ b/test/unittest/pid/err.needed.aarch64.x
> > > @@ -0,0 +1,3 @@
> > > +#!/bin/sh
> > > +echo "skip on aarch64"
> > > +exit 2
> > > diff --git a/test/unittest/pid/err.needed.sh b/test/unittest/pid/err.needed.sh
> > > new file mode 100755
> > > index 000000000..d6b041b60
> > > --- /dev/null
> > > +++ b/test/unittest/pid/err.needed.sh
> > > @@ -0,0 +1,23 @@
> > > +#!/bin/bash
> > > +#
> > > +# Oracle Linux DTrace.
> > > +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > > +# http://oss.oracle.com/licenses/upl.
> > > +#
> > > +
> > > +# We should not be able to trace on a hlt instruction.
> > > +#
> > > +# (When the probe is "needed" -- that is, explicitly requested by the user
> > > +# -- we should incur an error.  Test tst.entry_off0.sh should be okay,
> > > +# since dtrace will silently skip over such problematic instructions.)
> > > +
> > > +dtrace=$1
> > > +trig=`pwd`/test/triggers/ustack-tst-basic
> > > +off=`${OBJDUMP} -d $trig | awk '/hlt/ {sub(/:/, ""); print $1}'`
> > > +
> > > +$dtrace $dt_flags -c $trig -n 'pid$target:a.out:-:'$off'
> > > +{
> > > +	trace("hlt instruction");
> > > +	exit(0);
> > > +}'
> > > diff --git a/test/unittest/pid/err.needed.x86_64.x b/test/unittest/pid/err.needed.x86_64.x
> > > new file mode 100755
> > > index 000000000..158336d98
> > > --- /dev/null
> > > +++ b/test/unittest/pid/err.needed.x86_64.x
> > > @@ -0,0 +1,6 @@
> > > +#!/bin/sh
> > > +if ! ${OBJDUMP} -d test/triggers/ustack-tst-basic | grep hlt; then
> > > +    echo "did not find hlt instruction in trigger"
> > > +    exit 2
> > > +fi
> > > +exit 0
> > > diff --git a/test/unittest/pid/tst.entry_off0.sh b/test/unittest/pid/tst.entry_off0.sh
> > > index 1a4c3d207..304be4568 100755
> > > --- a/test/unittest/pid/tst.entry_off0.sh
> > > +++ b/test/unittest/pid/tst.entry_off0.sh
> > > @@ -1,14 +1,14 @@
> > >   #!/bin/bash
> > >   #
> > >   # Oracle Linux DTrace.
> > > -# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > > +# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
> > >   # Licensed under the Universal Permissive License v 1.0 as shown at
> > >   # http://oss.oracle.com/licenses/upl.
> > >   #
> > >   # Although the D script takes only "one second," it takes a long time to
> > >   # shut down.  Until that has been solved, increase the timeout for the test.
> > > -# @@timeout: 120
> > > +# @@timeout: 240
> > >   dtrace=$1
> > > -- 
> > > 2.47.3
> > > 
