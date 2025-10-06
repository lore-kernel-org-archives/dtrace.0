Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EBC2D9EDF
	for <dtrace@lists.linux.dev>; Mon,  6 Oct 2025 16:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759766985; cv=fail; b=RsJM4ELOWcWUu+ZqLKqAAJnLMF8ll08oz0TtOhzBxXOQ4QsXvz7XxvyeB+mAYFTytm1kQUUeHVMBe6ofy7Z7MealpxmjWz6AmmxOpEpL2ud3DU+9/XvHWgGEYkD6zLBsUwqU+sg8w/5PCnP1vhUt/w3p7bYi579A1coOEWif3gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759766985; c=relaxed/simple;
	bh=Kz62LGgU2hjLQf0D9O3cNtw+bmfIPgyKy5q84QpbtU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NmpxReIpTnjmJQE6/ixPNV0aAmPnzTDzCGO0NXPY0c2OAxweiXmRD2Par0iYJyojHXsulapLKiootEyZxR8foYde2SJtdxHXWkYNv+ctuWmPEO+wmnLTtemVvf9WQxTv8cAw+lbUyy5/aOzrPrQR73Z1bG9pw2MKfs/XeEVQbss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gZdMmSAK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=k6bh+z1c; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gZdMmSAK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="k6bh+z1c"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596Fxk8r031065
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 16:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=YKWFybnc7AgrZnaSFh
	BSd4SVZpCTYHgZNv4nTeyj27Q=; b=gZdMmSAKBKXWINOnzhRkTfZn1hvB2K6inh
	xqrlho3EgouH0yjdu4PQj7D6Sr4CCxLiQVswOJX8fWKfDdwZKNJbIBIXF6nikwAh
	GRzfbOcg+1Ha3RBGDS9FwxLsYxRe2YLCIZESDkIb1Esc4sO92FezZnRKd9AmDN2v
	53KIWxfqwh3RnytmuRiX5fMIBFyJAfVDOL0Kn5SAqvuw8j4ui4E7l6khOna23oIT
	QJEwelf2YRiqI6VME7Au4y1b9OrdKsjdlXJgGwhrm2yT1EXixEwoC7FQdXHILvB7
	3v89zLN65eRrwuN6vrqF/DlZOsS9LxZPpWW3OTOf4rKlH9n8maYQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49mgw3r0u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 16:09:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 596FP4WA035081
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 16:09:41 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012040.outbound.protection.outlook.com [40.93.195.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49kdp3pwa8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 16:09:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmQwa8hYcU9flz2xjA3GSfOqzvZUCu/eiWg7RqpGcu1q91cDLB3uFQ9i20rMAP70jR7GytW2zOgi84XVpkTM1zs3qb42rTfPjJXWRg4h8HtAaUtwXTqEDU7P1vvORS2kcUEe4NG+OZLcfKuVvSxowfwiLLwH+IedmY88W6jrXzdHttUkKvQY5n8uY5hFYhGpYru4zviG1RV1npvsaTXphhYx3BUboPRijH5Fl0jZL5New6024nei2zWEnU1SAMiTZAjmdsXKm7aOyTj3cSL+S71QNpD0wBONkEFM42GWHfbdyfM1P+RdaByRHyP3iufnSdgtr8/9wo+QOPUcuOulaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKWFybnc7AgrZnaSFhBSd4SVZpCTYHgZNv4nTeyj27Q=;
 b=HLt/uDhjxqAXmhi5D5xHtwuBA3YDnmaYOsmqCGMzpvzkCJ8Ov0MpfBlzJVXnJBHZsX/rDA+NLKrJ712kf/UGfqK3kzpoupntedvvPjQ2HWSAeRPkUR3b7U/e9/3BiP/BjiydWlP1/CXAiujqA44KrgQ0cip2AYYlrLYyrS9uTefhFLMuKwNjRNKlm9rRRukOJtTl9jzT3RJP7s4QTDjYc9aO/vTQXWaXDqssY6ny4mfzsfwvzQIpF/Gr+rYjfjBxtom5K82IUsIslRyhnNKCzAfkPXl9ue/wYBEUQytwPUCoQcoeGG/iyRkLveqQZhRCd0YJV2eIOdLjyUyQDQWHsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKWFybnc7AgrZnaSFhBSd4SVZpCTYHgZNv4nTeyj27Q=;
 b=k6bh+z1cB5bVpxJ8DrVNw9WzKh8/bbF/S+Kll4yjvgqy6z1M2pqpdv6vTC1Glgq7IGnHfxo2bdH6TPZ9qYaFEXPD4CgXJkZpPkh2EnqG/oZAARmGe2k8v3iqKauIcctJUVLrzC8S449ObTlKScsrKQVLjDtNHSEj0a3mfzbVvo4=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 16:09:32 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 16:09:32 +0000
Date: Mon, 6 Oct 2025 12:09:29 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/5] test: fbt return0: work on quiet systems
Message-ID: <aOPpuSFUk1GWVokj@oracle.com>
References: <20251006152829.239100-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006152829.239100-1-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ0PR10MB4814:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a0f06c-c7e3-4fb9-bc49-08de04f2bc93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wYw0mAE8UX+nd2i1WlDzeTMFKp3hvg65YDHSMbLP0QFEUz35TiZ5cfLty5yD?=
 =?us-ascii?Q?AzUaqyZHCg2IsOFuKQ7bTMAasOEg21lbNBPKarYupquenP3ktuzl5V58qHj2?=
 =?us-ascii?Q?vbtzmbhm0avj+bMXg3lOcIcPCWi7RUJUTAXLr6ALn53Bo9bfxnisDG/ioQdG?=
 =?us-ascii?Q?8IE7NlRSq+vIcBEUIhemANeQrvy2SKRqpY+HUKXBGcqlyMEwfO7fLcXZZT+q?=
 =?us-ascii?Q?nXFEMXf3gpHpItRNMV47CvOHWuwLIUE645T1v4lubegYETe9BlgS9Qd+9sHk?=
 =?us-ascii?Q?Vvubxs15OQFZsSIRduk6NdxEv9ht5b5TxoMEZqMdZp+6H+dfdIqvJWrqgd7E?=
 =?us-ascii?Q?VkIEOJkyREsmtUk66ueKqPFPEKJJiOaRyIq2YbhjkQVZRtQh07ME4b1rsaDf?=
 =?us-ascii?Q?8h40YvYW0hnsHTyeg6CDBEyVK8w7W4or8+VxS6J8ouCTI+qVmDhuRzPjMdif?=
 =?us-ascii?Q?cveBvaV2iOfLq/Ua/P8tPzl8IaCHDONJCLsILObaZfRclmTdkqCGIXon+hls?=
 =?us-ascii?Q?T7UH72hZkqgSwmEYUXSByBbQuGMKDtdZ3qWw27DY38G34h5LpirzbinSQeWI?=
 =?us-ascii?Q?zbBnmie41QH0stpyxAtxev5zIewf87WsCRmSEZ9phOsBQBXE3r+uONEWBEj6?=
 =?us-ascii?Q?mm2L3N32EYq4LAtEdv6Z8c4wAUxPpgchbK2GHQiDP1n+eqnCekYtRg7/PiXy?=
 =?us-ascii?Q?WpjlZ3PV9zU+PqSnu/+HhsfFaxORm+64Zj/ZiqvsBXzo+Axlwvit7V1ww6Do?=
 =?us-ascii?Q?76ri+0EbC0iyKKWi+pdw9Stvwt82+TH9RAig+kqkppkrSUhKCL217EIHrRnS?=
 =?us-ascii?Q?XyQ7LuKzItwRbfLoJlu0dllEXfcuo49eEez17mWl4MvjY609vlvKtanFRFM2?=
 =?us-ascii?Q?xjZDS9w3J/Lbx6LH5HP1n22LOMJ75M+/R1uLTPFhhdHgqzzI5Zblq0uvJj7Z?=
 =?us-ascii?Q?F/xJTisf5Vf+ZvqGNPyweaU3BgDpdbqZf2Opou2H/0Fa5HjX55sd2LoMsiDc?=
 =?us-ascii?Q?jajBNMeLXbpe6Zkx2kf+0Tk/JeSxhlOHNNbu76pjGwA6CNwhcq0XJ62k+VR0?=
 =?us-ascii?Q?2Q3l93+lfsEeeueV+jCn3vNXk0H23hxAQIL+wu2O8IrlQxZnh4LyZnLczkS4?=
 =?us-ascii?Q?uFeJ52x0llxKc1gtfDhMrFariqjKCXCHZm9+lAh5QIF4xF4gYx+I6x1nd1jr?=
 =?us-ascii?Q?jXfzJiET2js4Jm9g4KlE0yCB46kNgCh0GNnRWa/mhiSgsejA4cY0v7cVWDF3?=
 =?us-ascii?Q?breY16Wvr+S8/BcDczAF6PKhYW0/VvSCTV3rjcFhymil9QJ3qmmcqxvq7dQp?=
 =?us-ascii?Q?3d7ndkUbjmIpCF/Dr+yCF8Ni7OrPHJAwiMeyrjrdA56wt5yvEFYkl4/JZHAl?=
 =?us-ascii?Q?2fBKWV+CLbuq3FLh9l+EYARYCEy9UGuRu5W9Rl2uDog8wC6CIjTVIvJy7OBv?=
 =?us-ascii?Q?ccviYBtYHfxXWWgn/pzcWzsvnVlZLjetFIXor0CY1BXwvu7QV8UH5A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?702w1bM6yYxPFP6DPHYSJ9Ivh+xIT5UrWrhaVzljcyiPncIwICj6+VpqbTwV?=
 =?us-ascii?Q?yqLWq9+xylb+6nBZXP9b4hgcyR8VTGW0619asvAh13Af2YJqBzeUjVNFZueg?=
 =?us-ascii?Q?tmiXNX/N3I1wMqN8st6SyBgYhIMmkTQdA2/EEwCcyW19MYNOjcpH45qjy1+x?=
 =?us-ascii?Q?yq3Usj9Pn7nHIcng5RqH6kdPg4u4x9VeNRzLRDcL/PT8ta/vIs4bKH6proGt?=
 =?us-ascii?Q?MK9kBDinHnAZgwJz+Uw1ZZHg3P5VLjtfUAJxYlmVj0mphg45eaQN2JntxvJU?=
 =?us-ascii?Q?Yh9eizLwvIsAbm42t0TU2PFIFuw5MFZ0MC9gbtyswmzePpiTfyekpBsEFsWO?=
 =?us-ascii?Q?itbgozx5PFzOdoDX1sLwKBYZrZdpVe0DeYbyZBm0D9noUqGktdROxQp1Q8xR?=
 =?us-ascii?Q?pxiwUf5Dh+bTqKjAvhBZWJxlKOmeqzlRDSz1QkPrC8PLIPh929t780nsrFeS?=
 =?us-ascii?Q?TCfCEhCztS7iMa4VvfA4IOEitTn2sAP44R0/0nl5IvspnnjaqXsSZAImQXL/?=
 =?us-ascii?Q?SccmqtL+v+3lXvlNESyEExPSoZBixloQ2YK1T9fzFzwOIts00mhLAq7FTzxD?=
 =?us-ascii?Q?KnqimGTIge4/3QDOfnfLwST+BSuwGUgDgfMMUVzFbvGXZClrR3gOhr+30cOr?=
 =?us-ascii?Q?csP/cjc8beNkUK6GKR7arPweMe2nVxqbffP3AJWZ9oV20NIIifY8rSkZGOC7?=
 =?us-ascii?Q?lUWUqSCBW5S7J9kYHz6pqReEwQTZB5X5rgVHLesehCKhO40Mm+5scThWdDvt?=
 =?us-ascii?Q?746JdQ+N0TN69HhSEcFc2doxPzDNpsDx0q4H51mlQslpeACdgl64XJgrf0xM?=
 =?us-ascii?Q?4pYfbtXnUfKfr2GCbgG3SwiSfpDSziTisTxwQRJZgfKgBk3C/e+n7W3D+iPl?=
 =?us-ascii?Q?gkCMOR/OyybsYhUf0CCu1rKBFp6MV4ce/ia25to8NoeDKg0cPZXeN+yGv3Bq?=
 =?us-ascii?Q?8yLQ6lycDUtxUI0GmDupc/qeKhxDpe1d50LnfLsee9ao0Cnl0qLRNbBAZwb5?=
 =?us-ascii?Q?X2roaD803zKZ/6KqgWloXJ7ojj+OoTE3Vl/u0CFu9vqT6sJpnd1IfHSxL7M+?=
 =?us-ascii?Q?oNIN1P7Vrtgh/GlVm+9lO08UToZ90rCbr2kzu5Y5ABttLtSOrCrNhAfLWGDZ?=
 =?us-ascii?Q?OHGNWPQALoSFuZP7RTtgdrWr/9jGsrrLkiRp4iy3OOAxkzXUZSeAaUUUQDsh?=
 =?us-ascii?Q?9wWWvOgvmIH9JcBPI+R0qjkBpbuZdpgoyNZGDfFwywqnk1o35ge8vkmTmfKy?=
 =?us-ascii?Q?Tm9gfl7rBH/5HfgdoKKSACXQjJ6aMnloBibfX1ngjjk7dMRb8kZwaSy8Xt0K?=
 =?us-ascii?Q?th8vGHjsd8N88EEdaVdLbwn1SZuvaRjmOUoUawhC8KblZ/0bzP2o4zciJec9?=
 =?us-ascii?Q?xG46c3JoQebzdq0Sz/HEeC35LSLDUUci9u+kt84J9Ny29kBRP2Q5yZDovzf9?=
 =?us-ascii?Q?qpTJmyloZ5UYjk1MkjHYwo3LIwQfMzsN+FAQ9+XS+vjLBtvAQq3DCZccVVrd?=
 =?us-ascii?Q?d4gGYwS9dIFMHRmEe1RCNHKqVG/t2z1Xxu/C58O9l3Yuv9IIfhMd0v8QBycr?=
 =?us-ascii?Q?wbxysC3UaiuPSmv1sI7jwNxqYUGBvP3vsytAaBYmGqdaKDhVF+wCr4K3YstK?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Pxx8V8RPkf9Rn7uUt+f1/UjjHn+FDACm/5CqCv84npmi0ZQrVf87oNpnq2+8EgRIutLxZTniJ9dVTIjiEfJTk12wyjdU5TTNTgXHZcXxOSUQZKvrU3Wh4SlZoz6IIHCq/3d8M1IAqi5RFlVA2K3M4R2/0ZkdDqgI0nGd2aqnyu8Wcj7PgTpvVn/HyvfxxTYGIylhQuGiL7Vi3zVVQnV/U7R9HV2GKZCc53h8J3aZGe3yJBfSTEU0gNeBZkLT8/IpcNsjGc198SSn+ZjlaG/qjmgp28OKqVkP1IfTwxcIMLkIw5xgvU5LEUERZGkhpdeJM4hB2NVmRuRUmd6E9VhmP+WyNoUeqwxPQPB6EaEhQMncb5bSlBXR7hnhRz/BQaFmrbJS7wj2SXjL5Y2CLRXIsLAC42jPXPhnzMnTMpqSbTPjwONSOWWAi8/HEZA6HAfcv28ZOK+Gr9avbyTVhWjebfctQSLoKZMKu7zwAJmbocWnYJekBHqkqVkcThmijZCIt64HdexXlVZWo91CPoQo6FkkhXj+F9AqP8d+mwqQQv4juHK9qPiQg6veOgpLFh3m9JxzFQqPRvqjfxw17PZjv5iXheL46AE/HJ8xbdEo5fE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a0f06c-c7e3-4fb9-bc49-08de04f2bc93
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 16:09:32.7412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ok+8BXBeE0/8nV5CBDtXNcf44sGdaKkzedADBIx9rZ5L4jr3CwXkBSp3plg6BePV+kEo8Rddmehrt37GxhQzpW3x4WoiQnFgOn181CQamWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510060128
X-Authority-Analysis: v=2.4 cv=LfsxKzfi c=1 sm=1 tr=0 ts=68e3e9c7 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=eSGOEz22HbIQEaH1lfIA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12092
X-Proofpoint-ORIG-GUID: by3OtyI6VqSWFsIWzZD_Wz4DgXEm2tn9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyNyBTYWx0ZWRfXyatmhc9/ypFn
 wLi2GCvxs16XfWZffRHUSRVX0DWoPuJ2szqXa1iLB+q7YCMgCY3oO1RGx1lpZyiOQ2DNBJ8h4UD
 Zfiub/6sVUdAmPFXx04SpGgjtmZ+AZQBa1kxnM5wAbl9StpzENB/o+vmreArezFNRHTT7+bdSV+
 iLLM4yQ6FbCBMQPWzYTbnZeRs8gJbF+f+MdbxM/kCmLQosjlg5r3EZ1XH87z/kK9MQY4B822kUb
 8b762wfLL22dyoMudaOC6iJPItZ2xm9oNq9ZZ2OHHo1ZS2+C9LPTJxUkroIbM7zFkeIiJ69hc3E
 xnXHbrK2BPUe2/xfHaP3yPs7dvMCkRpQT8mKhhuRBJdQp/2OzLJ8JqqtFTzxKlo6xFtDx9SmvHq
 qlyDpQ+tpp0EA/1Y6fAVCvn/2Ptf/shqLcwcl4cmoRegdWzPeZ4=
X-Proofpoint-GUID: by3OtyI6VqSWFsIWzZD_Wz4DgXEm2tn9

On Mon, Oct 06, 2025 at 04:28:24PM +0100, Nick Alcock wrote:
> These two tests probe on sys_poll and just hope something calls it.
> On sufficiently quiet systems, nothing does.
> 
> Define a trivial trigger to do so.

Why not change the probe to be on hrtimer_nanosleep and use periodic_output
as trigger, rather than adding another trigger executable?

> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  test/triggers/Build                          |  2 +-
>  test/triggers/fbt-tst-poll.c                 | 23 ++++++++++++++++++++
>  test/unittest/fbtprovider/tst.return0.d      |  6 ++++-
>  test/unittest/providers/rawfbt/tst.return0.d |  6 ++++-
>  4 files changed, 34 insertions(+), 3 deletions(-)
>  create mode 100644 test/triggers/fbt-tst-poll.c
> 
> diff --git a/test/triggers/Build b/test/triggers/Build
> index 4ff5002a853ed..bd6b0510ba003 100644
> --- a/test/triggers/Build
> +++ b/test/triggers/Build
> @@ -4,7 +4,7 @@
>  # http://oss.oracle.com/licenses/upl.
>  
>  EXTERNAL_64BIT_TRIGGERS = testprobe readwholedir mmap bogus-ioctl open delaydie futex \
> -    periodic_output \
> +    periodic_output fbt-tst-poll \
>      pid-tst-args1 pid-tst-float pid-tst-fork pid-tst-gcc \
>      pid-tst-ret1 pid-tst-ret2 pid-tst-vfork pid-tst-weak1 pid-tst-weak2 \
>      proc-tst-sigwait proc-tst-omp proc-tst-pthread-exec profile-tst-ufuncsort \
> diff --git a/test/triggers/fbt-tst-poll.c b/test/triggers/fbt-tst-poll.c
> new file mode 100644
> index 0000000000000..8b1e72eddd258
> --- /dev/null
> +++ b/test/triggers/fbt-tst-poll.c
> @@ -0,0 +1,23 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * Simply loop, polling stdin for something that cannot happen until killed.
> + */
> +
> +#include <poll.h>
> +
> +int
> +main(int argc, char **argv)
> +{
> +	struct pollfd fd = {0};
> +
> +	fd.fd = 0;
> +	fd.events = POLLPRI;
> +	for (;;)
> +		poll(&fd, 1, 100);
> +}
> diff --git a/test/unittest/fbtprovider/tst.return0.d b/test/unittest/fbtprovider/tst.return0.d
> index 0b7091b320904..78a82ffde7473 100644
> --- a/test/unittest/fbtprovider/tst.return0.d
> +++ b/test/unittest/fbtprovider/tst.return0.d
> @@ -11,11 +11,15 @@
>   * SECTION: FBT Provider/Probe arguments
>   */
>  
> +/* @@trigger: fbt-tst-poll */
> +/* @@trigger-timing: before */
> +/* @@runtest-opts: $_pid */
> +
>  #pragma D option quiet
>  #pragma D option statusrate=10ms
>  
>  fbt::do_sys_poll:return
> -/arg1 == 0/
> +/pid == $1 && arg1 == 0/
>  {
>  	printf("%s %x returned 0", probefunc, arg0);
>  	exit(0);
> diff --git a/test/unittest/providers/rawfbt/tst.return0.d b/test/unittest/providers/rawfbt/tst.return0.d
> index 0146d684f1033..915830c800b70 100644
> --- a/test/unittest/providers/rawfbt/tst.return0.d
> +++ b/test/unittest/providers/rawfbt/tst.return0.d
> @@ -9,11 +9,15 @@
>   * ASSERTION: simple rawfbt provider arg0 and probefunc print test.
>   */
>  
> +/* @@trigger: fbt-tst-poll */
> +/* @@trigger-timing: before */
> +/* @@runtest-opts: $_pid */
> +
>  #pragma D option quiet
>  #pragma D option statusrate=10ms
>  
>  rawfbt::do_sys_poll:return
> -/arg1 == 0/
> +/pid == $1 && arg1 == 0/
>  {
>  	printf("%s %x returned 0", probefunc, arg0);
>  	exit(0);
> 
> base-commit: 877fcdeb25b370be182d51f27fb4bd8e4f739fb1
> -- 
> 2.51.0.284.g117bcb8de7
> 
