Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0C728469E
	for <dtrace@lists.linux.dev>; Thu, 20 Nov 2025 20:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763671117; cv=fail; b=CpElkyBQMvOqPKxwg+8jkOMWtHBFBvcaeyixdn59aVUm7kcdzGnlMXMIOIhVGcaw861UI0xsSI8qgc7xjwIgkP01wVdqzo9G9/yWVxaEJnFhYdlm19IYQWnREqmVefb/pzvMfUHgBsYeHgDR9u1ngSBMjlaiQyhX5LpXuhw9fzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763671117; c=relaxed/simple;
	bh=50s/LrFg3AACRIM0foznl7+dRlZ0XUYddXmid29amE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RjojKZ0axwP6aJhoK1oCQnxNMO/Egzl9vL4iQKVBk77Hf4c7pzui3SeUAWOKLbCMmak9pdJCqlGQvyglHVdv+phgTbZEKYEe3wrOzaza7suRIZmp+L7PIbSEfVsBRKLKcZ/vzbQCdXR1uTzKiN/QKmuktqmeTtRnVYNwFu9JpWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QMKiKiHQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jNg6BsVf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QMKiKiHQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jNg6BsVf"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKJghgu026646
	for <dtrace@lists.linux.dev>; Thu, 20 Nov 2025 20:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=YVbpbn6N2iFb2V/jXh
	AbbrcFfDs/QHX3y1a85XpY0Xk=; b=QMKiKiHQGuUeUZIblegD7eMV67E2u1kvyU
	s1Rtre5APcj9kR+mP5JtX7sLfJPBR0LMviwT5EPljU4ItJDA53VS9aFMODnyNJt2
	wVx4zBzV5raO5LR2jIoHA77kWSiur5Cnjxtc3EgYNj1BzNq+Dw0t6gSmLjEHJYVQ
	UZEs5Gr+pyeWkAx8hdZl3vFJ8axH6g9AdM05AeZT4OTtyXomoyo2/sip5OcgBiff
	h5uAlCU2RAg9pmdcWbdgJPKIUUcrX5TTttJrxtCbb9CQFJjmrO2OEi7iplYIvQ1k
	VFzUk2BEzgwpVz3kL5koQ5LuYPBfRXOkm/AZGBKzl4/ShFHHPMXw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aej90a0gf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Nov 2025 20:38:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKKPELS035996
	for <dtrace@lists.linux.dev>; Thu, 20 Nov 2025 20:38:34 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aefypybhf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Nov 2025 20:38:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gta3g5W113x27wxFLfprSDN5pUe3pdL+XVw2t0yiIZP/tWUzEL0MngpElqv8npLMKisW6A9RKr5YIeW0V+kLWRL0ZiIC4/PmvImtmcocCRzNwV/FdYpURHJm+eatxspr+aZv3sjq0G4+JQQ73ZiaTbXmwDMVuzk2y+YJep7KTcPXL521d3BVu69/PnYCvHGwB9tZrfHUejUPRLxJGPxavorksMxRC+K2iCqhNxww2p3gdxYrTmJ7VoTIJzx2AEW/phT9AsGlSJ1g8JzRLXvJ7HCigggPrAQYfUvOKbwpxNHhqNKlI5wgGdT9NgA0IpcPT9S5B23pv2JQSi2/1zO5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVbpbn6N2iFb2V/jXhAbbrcFfDs/QHX3y1a85XpY0Xk=;
 b=Awom/i+rWrW2zfROUMvkkWiG7033+OZb21k4RiXfsBY6ZCPlYFPdmbBy+P2nnKZPOh5A/9YgUmkBTRWfbx5VD3qmIgH+n1VdCL+CH3SjW+Jo5N9Mojb3+AMp31RI0p/wm2QSNG2Z+OQkpBRQwbLtgWL7xzeMwR7xZumgOkC1dSXgwNwRrAo+5v+gsezTdLzs83rp1mMmHf+Wo0ADkC2+4A6QrwII9ZPjjRGLpaK+hlf4Do8BkWWNaasSk3TnVLaVMvwqTGI9Lu6lL+tadfsGuARk6SMeqFBDVlW74GunpBq2ZjEIEejWYuw7ZiLwdCVqxlMLJdID8T85dRxddIKU9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVbpbn6N2iFb2V/jXhAbbrcFfDs/QHX3y1a85XpY0Xk=;
 b=jNg6BsVfx3/o9FShw6qdeOAIffCupPcGqkNWCfVxwEHYFNWV9n927HjZWRHzwU25qPa1n+tGh4I+Ra3qhFVtFji2rOHdoN9zYB+TU2RgGJd7/vDTQ3bs0VDPATRrEGPsVAMyaDmerhfuM5792N13htvH9zxbnA+odsmitwPWCjI=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by PH7PR10MB6281.namprd10.prod.outlook.com (2603:10b6:510:1a7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 20:38:29 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 20:38:29 +0000
Date: Thu, 20 Nov 2025 15:38:26 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Do not convert "__" to "-" for stapsdt provider names
Message-ID: <aR98Qjq2zwtEV3Bt@oracle.com>
References: <20251120185311.28904-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120185311.28904-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|PH7PR10MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: dea5f2db-d2b4-4925-d469-08de2874c366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4LtSzjX426I2y6gAVmqNF+e1hrkeB4p7NE9/0uNpK8cLSo0FNVVBxzltAdKc?=
 =?us-ascii?Q?DB/TO+S6s3M2Nxw8xK3Hl3FghXmSJvYdcIUZQ0FfqY4ed0dICZc1ucsBIRXF?=
 =?us-ascii?Q?gJUteNck354gwj565iQnMSl6x2g74OX3eqVDU1yOuM5oTHctcxV8fPHJdG+L?=
 =?us-ascii?Q?KYYypUBQBuagwK1ziF4QiNCyf4wDvSHetGBz23BtITxdyqUh4v4yIeIkbDIH?=
 =?us-ascii?Q?sIJ5UMvZVGaV2Q/co5Dn+n8m/GH/BZfVMFlvyU6pTN5P87M6kJgKCDyP88Pn?=
 =?us-ascii?Q?XQgxhzueTDKBG8ziYWblfglBwv9bqQJbAH+Da72aI3NoFQAMbhWk04Cl9VBL?=
 =?us-ascii?Q?rERrZdpg0Zxq1zJXD+LZlq2B+qylAmaIVDGGbGje1WCuOvFrPyBfKmRN3ZCP?=
 =?us-ascii?Q?E76ZpLxRyBQuPQ6BWpYGuYgXCINB8hZXWBzV59IwwQSEla3bOaK92LCtmjJY?=
 =?us-ascii?Q?Dyxrow+IxP2UAhGknH6OS/qWgzFkkgbrmKR6EWNqri+qUA1bqueKikFlzTPe?=
 =?us-ascii?Q?pAidb/VoAdv9aOIwlfKnio7K28mTB2IOcE9JChsJw273kzD9XPSxOBDdqyyq?=
 =?us-ascii?Q?PnjFq8x73aXE5Rhd2OVFWnap0/7M1qKspDHkCNiS7SGMDG1Y86HqlxFEalCs?=
 =?us-ascii?Q?O8aIv/Bxas/Ko3P/gCi+kU4yWb8jGi9pV6dEDf0NpQcCm7fx7YFOixR2gE8V?=
 =?us-ascii?Q?so0E4P9gGBuRz02cCLMz/K3UfV1QOF4f6PdAnjj7dDC0YBqi3ruYnfJdJWJd?=
 =?us-ascii?Q?oYVyCA9SHEVwNhMPxRFtgmF9qduTne4KZD0IQ8FjgGd6K0JMgr2ptvhqBvxy?=
 =?us-ascii?Q?pXlJ3asG3zSG4DnCBS0/lpYSsvlMnfOpVBguI2dDo6qgqsNkcVBwtDQNfU3a?=
 =?us-ascii?Q?3e9qPs9uJ1EgdvYr9XZ8NQBbwY9SY8VU8RE107R8DnUNdy7tXAUFw8u3Y88H?=
 =?us-ascii?Q?QxVUw5wKdALGu2bBEsf7AwA6/qQK42CJpblRxf6JWS9LlekadkQeXAD6nzzT?=
 =?us-ascii?Q?O1ByaBXNW+UDAaSJVteFQuZQ1C5JT1PEw0u6RuUJW9LEES+A6CqfnB/7RL3l?=
 =?us-ascii?Q?aO5Z1k8BVoS9C2v2M7G9U3M07z59Sz7CzD9h0ubEohZNdTp3igHXewQxfzHa?=
 =?us-ascii?Q?1o9uPp4gEZKJCZUzlCmZTYelI04ySsEYCzVg22e+x6lAloScOoptFagNuw5f?=
 =?us-ascii?Q?+J1xfNQ0zN/yUx+3RLua//EzntmiNmKuZO+IF82/FTzS2a2/Si+cw63rNgul?=
 =?us-ascii?Q?5048RX0A/Yljy2q3Cl2C6b2v5IBq/SafbnwV7AdzpZss1TLM6tPR7sGmjJXi?=
 =?us-ascii?Q?L3We7jN2ZKrD/bAsSrko005HOtS1LLGVpvZK7cJalrZ1nl2ZMegW7vJrid5d?=
 =?us-ascii?Q?Pugn31vV7nLZHmU2/GSdtpQWO5hd2tBRJWPV1Eu09vb33HZGbEWafZBrWZef?=
 =?us-ascii?Q?2SSWjamAXcIWS6qRHIa6xikM9a4yvk3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x92F35x8mP3d6Cx1qUyezwi9brnh5Of+YHY4HC7rbO+ra7OTwl2ZWaRlaWY8?=
 =?us-ascii?Q?Y0GqkqWJLPnYu0twzkZ6Kr19d2BxOzAP0Rj0pGOQi9oPbAyIKsRtyeIWEKvT?=
 =?us-ascii?Q?nTJbA28bAUXD1NcCfJDofwORZ5nwKJJlT/ei0h8DUaYx7O9tzqoazYC5dwD0?=
 =?us-ascii?Q?0wmkrC565mKa/gVptC7v0NePwy16bD/9FqXnKA4rMaCEV19OEL7sU1fObRdF?=
 =?us-ascii?Q?tJd9lhrSzpvhu1CkMUyYhJvRvC3F6NHTTbHZYcZgcYafTVRC6Am52IzfsLxi?=
 =?us-ascii?Q?nX5VjsvHyOfjGJxvjBLOHKvS8QTxciwvMkz6JKxl6TCJSNk23QQskLJIga4Z?=
 =?us-ascii?Q?Sa1V9zDs77ffNxv53oktPVt3N3egN16QCZX1xBZb3Hd/dozlsw4Wqy3OF68W?=
 =?us-ascii?Q?rS13mALxk+KeWnhcIwG98hKCJLhC5w0s1LfhyoCF6OaVlZ1Oq+dLBHpX8Va3?=
 =?us-ascii?Q?IgTheYQVadgIhVub9+MeSRZQB+mIkYPwu2gy+QBaXcM5FxvD+Oa7BY5qsEO5?=
 =?us-ascii?Q?o9woNyHKAk4sJOBHk5u8S7hYwLfjc6qO6hrAGVVGyZEXwi5fBWSOXFpRFjIz?=
 =?us-ascii?Q?CtfkLC/A/dRAEDxAcwLVn2ZXep/zCRCl8J8kzegGMOd4CIQeSfyoFny5iI3F?=
 =?us-ascii?Q?bBw9q34sce6unt9Dr5JCdM9lIcZcxzUNiL0Ggpy73nAXu8DO1eeYREHCwN8f?=
 =?us-ascii?Q?g00m7zy+d4GA59M6wMAMk5epeS1O4HzOH3RNzw9fkDEzluuhvmRjMdT94Uw1?=
 =?us-ascii?Q?4llDgyOx23JHvXSHA2HTsGY1aW6IPa9tSDqgaLUkYMoJ4Yn0OwKBiV993z/c?=
 =?us-ascii?Q?iWTESrG36PuhUgiU3vqB4m3B9c26viijqQMKbJDuxljCI7SFsWN9cBvB0LdC?=
 =?us-ascii?Q?RTrEGEojl6VMVk6BTnwZ/J0kkoYDLBY8YIWmopjnRWoFCju8QdMJ+Ty2G4co?=
 =?us-ascii?Q?2+W97Rxsr/OCk7wO15ht6YKm6gOhZ9O2fzyo4bKsEkRwpkQey4VdojZiY3yc?=
 =?us-ascii?Q?32C6fI78F5WrmRk6J+G4jVmdaFETubjE7KibhHoqCigpBazqAOAyymF7/Zkt?=
 =?us-ascii?Q?pHM3BtsCiSxghslOPp7sfIX2+eaVxYMfYjpKZuN3LB9bUG1jW+PlwNJBV95d?=
 =?us-ascii?Q?SybrlSNb4zxWs5CT/RpVaT36/ATnGkRPlw6YonR8INwRHXhIyin++H3iv0fs?=
 =?us-ascii?Q?3/lH9jWeiNhxcAZIu+V5H8IMlF8UMXIiOPR0T5pRBEeTYX62rujGJlSU4Vot?=
 =?us-ascii?Q?vdCxGV/2FFthLrMlIwDHdumKHpNiqGTDY15NLCOBKVWRFax9gZp10G1UjQ6o?=
 =?us-ascii?Q?nX3tYVTKYEL8njM9x3Icdg5XuyJ0pwwVBZDjD29bUAeX4j35D+Do/zupvYi+?=
 =?us-ascii?Q?etgGOIKH407ydaI9AUzvuQGi5r9zw/+1yfB6GuZj5nDGLkNTeus95tFKq8OX?=
 =?us-ascii?Q?iIWKOKBJSiCBFT1RmcQEPFwgufNPWUJWm5wbix1VAyRdP3JMVeS3klbgD3pI?=
 =?us-ascii?Q?BCiJ/9JqozbAqwDte/t7x/YkbKfnZumFZazokmPt9WoPvFi7c0aLWys66Wyt?=
 =?us-ascii?Q?XnjgmfEoyVrPBB2WXlEkC/PR2QzBEThj4a2eHHUZw0TDSSZ6mXdTz/rg9P8W?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nG5ALdnNiLwwSu25+o2EKwzl5jncvJ6q1BWVzkaD9rwY+L9zViQwHLK+ZenloI3dR7hCXnwkdqFfCxK8cSDSBqSm/jirviYUu+LD+ZmHR4LNaLlLoE3fCWUsoagnKfOQ5QLN8CimHrfDFGHiv/gOrlXelrskj9raNmp1eM8mcSadT5l/W/bEpsLGJemaXOeT+EuehOOJSehi15ULygy4vrmcWKOlIuIpenoNJOyBcIxmgDZQXU5DY1GubmjK6Q5m8nJI+LTgUsJ8+mdP6yNrAoECtTVSnvYrXay92IrVhl8f40PRj3G1/LC/DfDTELiTk01oZGcM3NsL/Xa9tvnyjMrv6GAY7tHsl4RAUXS404MF8WYbU+I7YTsW28qVsWextgQm49LLMnp8l3e2YNZbDNnhNBu9h7qPk2HctVwb3khl/fdcTOfo27g+e04Lw8ESOfvJz+WZPv6u9kgKpiahyon9V6jJI2l+uEDEMcVMIZsnfAEdXe+U+co0tnuEhZs+SpeahXTq9AXpVZ+ra8+8G1+s8pGJH8qJA511o6tWjU+O693YyVp43ane2agNd8eRp/0kAraWSUL/ANACh6Krwz7/EWmVvqGajnOSJp/qvmg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dea5f2db-d2b4-4925-d469-08de2874c366
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 20:38:29.4629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90eF2oyVkwnzkLuv1WGpe55I9j6ilp8xdqSN61ip2fXADWF1VS/hFoplh0ZpH1as1uDK31eroxUJDi1gT4V4diUNVUaKoxVF1uo7qmyQxbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6281
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_08,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511200144
X-Authority-Analysis: v=2.4 cv=OMAqHCaB c=1 sm=1 tr=0 ts=691f7c4a b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=Q7Hd2Uh0GVzwwfS5EQIA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12098
X-Proofpoint-ORIG-GUID: Tjk0WJ0DIo2SvC_fIsVKJECYNcCVypM2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMSBTYWx0ZWRfX7VKg3bghVHUH
 /76N6nzD4QrtgKZU7EyQUrMmCTAeO8obAnA7BUps0i7pfBOxXV16u2f+/gXtNqLI1fXGRhhwGCt
 A2kvdA4x0daftm6dNEMen6rfoc4ZIaAMU8+C8NOWFikuxfMH47EXZGqkkWvupc2dnSOoMrI3mjN
 SYshV7KIM8iFtoXuMOAeIBhcwKqJoIKtANWGYq+RYWKj/jkcS0Jy6adJjKKKq7RulBiHP1c7OwC
 eeA4GfT50uHqFtEbNsL8kwzZnDudaS38gqGqhwj2Ligk0Xdv0rpN66ozGHboirSoiixpq27/6gX
 tSdd+iMfcuneqtDme3uUjh2UuppviuqFdiOgGKzUiK/hgbVXTor+GsdijCSCo0e9qY3fFPtrUo6
 E4zCQ/9WMAriOwJJwsjoXTgxzt9MYw3cNKRB3lTAt3jT58puOCc=
X-Proofpoint-GUID: Tjk0WJ0DIo2SvC_fIsVKJECYNcCVypM2

On Thu, Nov 20, 2025 at 01:53:11PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> DTrace converts "__" to "-" for USDT probe names, but not for functions,
> modules, or providers.  We document this behavior.
> 
> We provide the same conversion for stapsdt probe names, but we also
> convert stapsdt provider names and in commit 22932a9875
> ("selftests/usdt: add is-enabled stapsdt tests using semaphores") we
> test that conversion.
> 
> SystemTap performs the conversion for the probe name but not for the
> provider name.
> 
> Remove the conversion for stapsdt provider names.

I would rewrite this commit comment...

	DTrace provides "--" to "_" conversioon for USDT probe names.

	Commit 4f58b864a ("support stapsdt ELF-note-defined static probes") 
	included "__" to "-" conversion for provider names and probe names.
	Commit 22932a9875
	("selftests/usdt: add is-enabled stapsdt tests using semaphores")
	adds tests for both conversions.

	Since SystenTap itself also only provides "__" to "-" conversion for
	probe names, remove the conversion for stapsdt provider names.

> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_pid.c                            |  1 -
>  .../usdt/tst.stapsdt-notes-isenabled.r        | 24 ++++----
>  .../usdt/tst.stapsdt-notes-isenabled.r.p      |  4 ++
>  .../usdt/tst.stapsdt-notes-isenabled.sh       | 61 +++++++++++--------
>  4 files changed, 52 insertions(+), 38 deletions(-)
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-isenabled.r.p
> 
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 703be112e..39714bdb2 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -1360,7 +1360,6 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
>  		if (strlen(prv) >= nhdr.n_descsz)
>  			continue;
>  		strncpy(prvname, prv, sizeof(prvname));
> -		(void) strhyphenate(prvname);
>  		prb = prv + strlen(prv) + 1;
>  		if (strlen(prb) >= nhdr.n_descsz)
>  			continue;
> diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
> index b088b285f..19924aa6b 100644
> --- a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
> +++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
> @@ -1,13 +1,13 @@
> -test:main:zero-probe
> -test:main:one-probe:1
> -test:main:two-probe:2:3
> -test:main:three-probe:4:5:7
> -test:main:four-probe:7:8:9:10
> -test:main:five-probe:11:12:13:14:15
> -test:main:six-probe:16:17:18:19:20:21
> -test:main:seven-probe:22:23:24:25:26:27:28
> -test:main:eight-probe:29:30:31:32:33:34:35:36
> -test:main:nine-probe:37:38:39:40:41:42:43:44:45
> -test:main:eleven-probe:56:57:58:59:60:61:62:63:64:65
> -test:main:twelve-probe:67:68:69:70:71:72:73:74:75:76
> +test__prov$pid:test:main:zero-probe
> +test__prov$pid:test:main:one-probe:1
> +test__prov$pid:test:main:two-probe:2:3
> +test__prov$pid:test:main:three-probe:4:5:7
> +test__prov$pid:test:main:four-probe:7:8:9:10
> +test__prov$pid:test:main:five-probe:11:12:13:14:15
> +test__prov$pid:test:main:six-probe:16:17:18:19:20:21
> +test__prov$pid:test:main:seven-probe:22:23:24:25:26:27:28
> +test__prov$pid:test:main:eight-probe:29:30:31:32:33:34:35:36
> +test__prov$pid:test:main:nine-probe:37:38:39:40:41:42:43:44:45
> +test__prov$pid:test:main:eleven-probe:56:57:58:59:60:61:62:63:64:65
> +test__prov$pid:test:main:twelve-probe:67:68:69:70:71:72:73:74:75:76
>  
> diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r.p b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r.p
> new file mode 100755
> index 000000000..234d1fa55
> --- /dev/null
> +++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r.p
> @@ -0,0 +1,4 @@
> +#!/usr/bin/gawk -f
> +
> +# Replace pid in provider name with "$pid" for standardized output.
> +{ sub(/^test__prov[0-9][0-9]*:/, "test__prov$pid:"); print; }
> diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
> index 322bf53aa..a839d5722 100755
> --- a/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
> +++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
> @@ -83,67 +83,78 @@ if [ $? -ne 0 ]; then
>  fi
>  
>  $dtrace -c ./test -qs /dev/stdin <<EOF
> -test-prov\$target:::zero-probe
> +test__prov\$target:::zero-probe
>  {
> -	printf("%s:%s:%s\n", probemod, probefunc, probename);
> +	printf("%s:%s:%s:%s\n", probeprov, probemod, probefunc, probename);
>  }
>  
> -test-prov\$target:::one-probe
> +test__prov\$target:::one-probe
>  {
> -	printf("%s:%s:%s:%li\n", probemod, probefunc, probename, arg0);
> +	printf("%s:%s:%s:%s:%li\n", probeprov, probemod, probefunc, probename,
> +	       arg0);
>  }
>  
> -test-prov\$target:::two-probe
> +test__prov\$target:::two-probe
>  {
> -	printf("%s:%s:%s:%li:%li\n", probemod, probefunc, probename, arg0, arg1);
> +	printf("%s:%s:%s:%s:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
> +	       arg0, arg1);
>  }
>  
> -test-prov\$target:::three-probe
> +test__prov\$target:::three-probe
>  {
> -	printf("%s:%s:%s:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
> -	       arg2);
> +	printf("%s:%s:%s:%s:%li:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
> +	       arg0, arg1, arg2);
>  }
>  
> -test-prov\$target:::four-probe
> +test__prov\$target:::four-probe
>  {
> -	printf("%s:%s:%s:%li:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
> -	       arg2, arg3);
> +	printf("%s:%s:%s:%s:%li:%li:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
> +	       arg0, arg1, arg2, arg3);
>  }
>  
> -test-prov\$target:::five-probe
> +test__prov\$target:::five-probe
>  {
> -	printf("%s:%s:%s:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
>  	       arg0, arg1, arg2, arg3, arg4);
>  }
>  
> -test-prov\$target:::six-probe
> +test__prov\$target:::six-probe
>  {
> -	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
>  	       arg0, arg1, arg2, arg3, arg4, arg5);
>  }
>  
> -test-prov\$target:::seven-probe
> +test__prov\$target:::seven-probe
>  {
> -	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
>  	       arg0, arg1, arg2, arg3, arg4, arg5, arg6);
>  }
>  
> -test-prov\$target:::eight-probe
> +test__prov\$target:::eight-probe
>  {
> -	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
>  	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
>  }
>  
> -test-prov\$target:::nine-probe
> +test__prov\$target:::nine-probe
>  {
> -	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
>  	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
>  }
>  
> -test-prov\$target:::eleven-probe,
> -test-prov\$target:::twelve-probe
> +test__prov\$target:::eleven-probe,
> +test__prov\$target:::twelve-probe
>  {
> -	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
>  	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
>  }
>  EOF
> -- 
> 2.47.3
> 
