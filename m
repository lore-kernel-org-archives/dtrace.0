Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8AA2DC765
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 19:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757619824; cv=fail; b=vBmWKmblG2I4oOs8iIVuWTu0P+NMyw65yTXkuUXeG5aDqIwBHZ2M8lGlzYEYjrss30JN9k7zYVQkU2fnrvdRTNRwz/v/mFsZXVBjUB0IUq/5BdDYWx8m7tcIJO+reRiEFrUUKTMt03DfDewJ07Xw9h/OtJtM28nmVpQqz7eKbV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757619824; c=relaxed/simple;
	bh=ztlpGM5aZZ3bhN9yKHuquDAn85tun0mRBXVvfOAs1JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tKW4AMK1SIim39w13k6TfmwZ6YC4AWagsQYI4jrl9WvKxulyJH58QlwU5v/X+n48xlpFjztxmJCVu9kRwwW146VkizTaTqEEgDTz9iPX59gBNq0R9ATyXqNwDGzARomQER6OpoCNnu35jPD+gxaMrvuQMOJAdBUzHCNrY4eLEmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cZB0Rtte; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Bd50eVrX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cZB0Rtte";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Bd50eVrX"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BHBhlI018803
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 19:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=AjHJvY/VpXw29BKMyu
	Lxkkf9j5wXX57KX82U/mXwRi8=; b=cZB0Rtten9uBhUz/snr13UIvG8cmcFrSYq
	mqkeL8tOIkMuAY9FmNjEd7ywatOJoPIzgmTAgJG1CwhPov1yUHpF2iCCrOa2K6kO
	sbB+wKVAeeG9P30Fi8SQ9nRf/Q01i3POSA4aky4D6MKSzrbzr/Tw2p6ff61ZsCT3
	sRYkvKpuV3N93OeQGl8S2eRVovKO+mHFZVQYtVcxIDFk1gccLAcE9jYpXAT5Brdk
	bZXH43H5mr4UecnwK8c82b7yvJOAMvtS77EwsWW38SFkTp3eBmDVrOtA5bwX2+2I
	CY2lZ8ApfNfkMqGDaXk7IyxMaA2eMn/pTswjqqF5fVfB2LsvUArA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4922jgy1ey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 19:43:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58BJB1kS012877
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 19:43:40 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012012.outbound.protection.outlook.com [40.107.200.12])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 490bdd3tk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 19:43:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GokVLGre6rhwWKxrCzOEIsaRSOkjSf/sToVlZ4RPPHE3owyEZMzWsc7QPb4Htl1zv6+XraBDpoDC6f/RAMikwPpySA02TEV7qRzuSVCCfz0XNbXxRRpmsLtl7Zcmeh7EOS9IRx1jobbWtOz1yPRmJdKvw+a+QkWHz8o41YBj7cmPaS5Sv8fuIaBBC8vcTcZJfK0MONS3Xw/VtXxtD9bD/Jb7AlDSpu5LKBOh6OJBWlVLm0DdCao262f6fpmTHLdzGnXisNSL884Jiz4xY3QnwYHs+IM9s+UQMt2w5Nr3Vs186A5R77h2MUNwiIV2eum8MKIBxO1Dau+CEdgs2tghsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjHJvY/VpXw29BKMyuLxkkf9j5wXX57KX82U/mXwRi8=;
 b=PqcC/yeCHhUr2Yvw6ziaqym6hLh1HXPqH2c8q53D6Up6YCfMyRzYJy2nv0kci3qM9Lxj5dm7Ijm4GuWWbEtBJ6Wfu2ZRsU+/MV+fQkwSVnC4KaD0sEl9kVSDcARXimmdwYdlm633KPIsV1aHKVUtZZj2trCIuw8wHFfiosVix4im3yFbKkd0uqZKPoUsZFrUoChZLe+3ckl8mcEfxR9+MXqLU9NOZ0oA0Jbu2W0vD5LU2nNtUBu5IfyKVmS/F0gtp1x4maHbAhOwgvev6PLqagJ6f2kH99U6gOwSXJf5CFtPSpPidRlpaTlaUVgnpTnaXL63ymuJmUjMdfnjNtpr3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjHJvY/VpXw29BKMyuLxkkf9j5wXX57KX82U/mXwRi8=;
 b=Bd50eVrXZ7Yg1ZKNJ4QBWxwhbwNQ0nerIJJsA3eH0BDG3/a7KICZ+9G5k9A7ngDbhs6B/g4JtX0HpOYXssPppDTGXZwM+UFLhYNlrgJPJFcaSssk7Gg2Bt5fYFWdFq89d55CpV3EowX+EMuofswIcqvjW0g/+nVwtXZeS/eZeOI=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA1PR10MB7486.namprd10.prod.outlook.com (2603:10b6:208:44e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 19:43:37 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 19:43:36 +0000
Date: Thu, 11 Sep 2025 15:43:32 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Add more robust mechanism to skip tracepoint common
 fields
Message-ID: <aMMmZJitjWJpISFG@oracle.com>
References: <20250911181139.27783-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911181139.27783-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA1PR10MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: f6532bf6-0fb0-480b-d3e6-08ddf16b7fc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u437gzYa30Bthx8BT/42VWNr1R+CXYg6DNXlb+m4tqe/10SJBkMEzV3WI3Qz?=
 =?us-ascii?Q?3uS4KdDyfMGFZVDmg7SDNHnXBEsPYQIsqs9oJ9CXAZW5jrO+PrrYswQsAdED?=
 =?us-ascii?Q?7KhQro/tso/TjtwG7IbxCPrrG7GB91d5AHLjO2t9pqauqzU6azaPzT74uOUe?=
 =?us-ascii?Q?unDZ/chiQhETv8iYn8ab0Q0HgrPsk/KhiLkkPMjZgYIZvv5lJirMTnYIvGWK?=
 =?us-ascii?Q?zQmIuAaHoNFj4PBciq7i7zftb87rM42ARQZzlSnTCOjRhEkU2fU579EIHlAI?=
 =?us-ascii?Q?bYQKkmknIJrDn5CLfZthu5lw5hS2jOKWEVJcAqTLrCwdKVms0s8TzxytC5m/?=
 =?us-ascii?Q?k0uC1YK5mN4g/MacD4ykz3wQi1h5xbsxitBSB1qNssCviqt6YBPD0SrN4Jyu?=
 =?us-ascii?Q?elKKWYPF0Yox5YdL6BtJkIXfcvDyVzvRPN6Oph6NYSv10z56v1r4LOWtYgQH?=
 =?us-ascii?Q?Zc2pscm3XwYpvZXTyJsOsK0omuu+7tNr0c+MKkv2TQcARzjNeLVwS/KiJtlI?=
 =?us-ascii?Q?Ev53Tpjttb21sko22AKkyUixmB00JP++PsCz6uqXLmxSHiSnKtpKewEVGUtm?=
 =?us-ascii?Q?lsC6eOwnpqwZbRFbOA8iNJZuQIN2n25ab0TBs9aRxRlhq0drmZPnhikuUbPS?=
 =?us-ascii?Q?xPcYrFHVYJJDLQDKgrFvXSb1Gni48uD/BPbmDRLvWtJ+z0h1BHWuaXmxLAqj?=
 =?us-ascii?Q?p1AffwHKODJ/uKYXaOM0U2laa0QJBB+92WoxS0n0Rv11a8DMFVxikKQfkJZg?=
 =?us-ascii?Q?e6KDwuR13ZxF30V06F1/SXf7hYiDLdq4NO8r6cZcJSePz74CQDZQ2UFWvjwe?=
 =?us-ascii?Q?rRWKu6iIWnzL1/AdH5mSe3/oAMjpaJ9aqxMLb7AJ1Zg+1/qWa83S0xhdjcku?=
 =?us-ascii?Q?bgguAkBKnZv/sv5po/akOY4/O5xyNiMbguvKNwSBkzeWTT1+7zhGzVDguyBb?=
 =?us-ascii?Q?H4QKPdeGXEQwHdAqMXSNS1ZeQz6Dbu+ogOVlbgZFP860+EDCvDtIdb7wj35i?=
 =?us-ascii?Q?sORySzvmAhcONoqv3Y4mD1QpJfBqmzrESfClqxk9MKq+KjKQORDr6nS5ooHf?=
 =?us-ascii?Q?cEwLcFZJarBjrO+GHZmFbYjH1wAmjdepoS5Z+hGYD06WxDqr7KD7htupILAD?=
 =?us-ascii?Q?gxCHCNTy+2hu8jGcRXrO2NVvCn/C8pAL42jPXJEkM3jk10hfLQ2ZFWvOji91?=
 =?us-ascii?Q?1cbyM9Yv8DKmgymcGdnP2nHE8sHEVUb8GZVv9/E0qZQ/6vTgV77E7NQUQrFM?=
 =?us-ascii?Q?grbCk8S8iWK5PdvPPr74tSlOe8DAlU/DCVKSJQx5SZEKLu3oTnlePLwEHK1J?=
 =?us-ascii?Q?ayUSp7IH12Ahry11PZ1ZljGHo2YTCCocsi9i/0tCNT6D0RSeERrk4Q9vamzC?=
 =?us-ascii?Q?X7PZYps=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CqiHZHytjZUQPycqW3h3N7yIfHazJ50IKj3enCZAgEf3YB6uhRYtbTOwWlSl?=
 =?us-ascii?Q?FPAvbqQn7lTQ98Qqia1WcFcziRefvRaao5cpvhltvKE1tzUXqWGZ8LHKYGOJ?=
 =?us-ascii?Q?w4x76i55jaH/7CDXPZD6IWXcEFo7nue78BYM6kud2TZoEXDAjAAg0UWNLKKc?=
 =?us-ascii?Q?90yo5F3kgOXpzN5vwZEIAem5WMhJjE3vqQDjfGsZgKfyzUnk1dkHM2EJXpvC?=
 =?us-ascii?Q?CLDdqThyGPxrggGzGg6w2sfDSKqoRfUCjP3x1NEARt7XLa5ZS04758tCcy8U?=
 =?us-ascii?Q?fZH6dhdfKmdkwl3fNops/wrMk7XukvuaFK5W45U4Tasz/RuwVm9d9JLsTyzr?=
 =?us-ascii?Q?k5+y9pqXdsEsA9wP4mnrjZXEVNL4VYYt3/mTszmpOwPOQ1V3EWpFAN4fMpMa?=
 =?us-ascii?Q?f5S0fKwI/X03LCkF+42FoKN2QdG6TFGLKJez9YgSeIbS3OVCxqA8oI7ejFdT?=
 =?us-ascii?Q?WiAK0qeMzqojH/CuHXU4Uj4pjsyXd5JbWMptigmmV8HRXOwfCKEgQ1nVnZ+i?=
 =?us-ascii?Q?mwHpJ5DChUz2BXGjQX0jto92Oe1Us/+eqcQhUtIibtr2oZZOrg/KQZK12yzV?=
 =?us-ascii?Q?m04InEu1oGy5RfeAhcG4ShQ5xujmAa166px2haXVpDdrg6VP4K6wdg6e6Eu8?=
 =?us-ascii?Q?y7pCYyc8djI2njBXdbyftB30wKKO8CmGL9SWuYNYgjDDZqDdRxKLtRT6/LYw?=
 =?us-ascii?Q?IDG4jWNG7yoUXCKOBmCcm2LnlslFxdoyivy9doYgjvVHCHkft9ynFnnt6BoG?=
 =?us-ascii?Q?mNq8ekaSyH8CS51DFKNS4vrRNn9B+4v0ZZGzb5uEjWQFWNHgHOyMFBxKNaSm?=
 =?us-ascii?Q?qXyIuKZtYJRtuWwfRXGFEBSP08Ml+7/1xSyLCBKUVcQHr6WZYp5D2lAALv7l?=
 =?us-ascii?Q?bU+zqj7mLOwSw6UNLtUfwMmUGxP0P4i5ggXZMVn28JGhWwgn9j1wSETMMffJ?=
 =?us-ascii?Q?7xbh9tphwpifpN2rDkBglTDfQN0MYwLDLmZMGZUfVaaPZ1CeCQfF7yyzKvnf?=
 =?us-ascii?Q?7gPR2HZpkT1NJfWT8W+csSSRjeV8caAspqq1mQrSJbxTKruFtC7pv2Bzlkhb?=
 =?us-ascii?Q?hXvLomthC03rewBpjPwVvvCynPVr+CTmM04MoeUDs0RIKT32uvgWjGhDYy7+?=
 =?us-ascii?Q?szKcqd01iPZhioUzReKNSjjb+5/tKUc+Ed6JFxqQ82Ga9KAldmAsVVN+Fcdo?=
 =?us-ascii?Q?UFtHJoUOEd6MBqkz7RpXVXBwuncJ4QA4pw1n1jKEi0JzGu23dPaaBqkayvQC?=
 =?us-ascii?Q?kLsoF4nPs67mn8DsLdpuJ2KrGdIrEFmu1hhPhVIYnKxZenVdCYTpVNrElgM6?=
 =?us-ascii?Q?KgHwDUykqxBCTZXqulN9bX+fcXT8gG+DVZReNi+nC3YiiJ+nMDLxGzp6pFRA?=
 =?us-ascii?Q?GPy2wLs1RP+zJKR+2zICUi8YsHkMBiOf4udCqRWhvIGlZA4s4Pm/30x8T13S?=
 =?us-ascii?Q?sEWBcdCqysxbafXON38vX05ZIqiZek95sidSQ02WMyaBU6xDWuJtws10Rhfr?=
 =?us-ascii?Q?XX+C08M21YXOIvpHACm5ZQalZTrClDaGbjfT9H6GtSiXbwHEZPw6N6rcyex0?=
 =?us-ascii?Q?Qe5UQot8EGgcZcywwgz+Mrs+F+pOFkB+1UuwxjH6h+T+60wXHfY6eUS6btTk?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p5Q2/uqVOksVbZdXm3MBfbOM4VE5I/T7ih5+vhKwfw4aUXEj8/eXk6/ftlWxhTXwKXWoTBK8FenbiORVf/1UiMsSQRmeqOVJECnuYS38xVFxtWzSNBw0GR6zDWl5qJZBsk7KnhaE0DZ3d9NTyLq/Pj6TXMdYMo/Wy8Jitl76CcQPEgFUv4SXKBnOC0KlSwrSHfbaKnUv02w8tZqvGdTf2bEeuanlEiD79fuTHxeLHTCcoxazxhpxA2FCdx/FJQGxdQeRM30z+meiRB0Gou8zbT4lyQDIoeHUh5K2nQU151wYpH0feRcAMWG2tM039ICiJ7CA8AuRVbKlrm+F47BacZ9+MspGtljjmt8KFvs1tczhMNKkn0uNz+5vtp2+CSA6CABTHprhS9idAIOG5EzRv6V5DRUYv+DJby7hbusfSiQvLBmaAMwb4pHqen/iD6Ooq4keakbLamXjZWiF1gHux8oqylzFX8lDKT7U0khy3O9+nhsR2APpZswvcIJoa0XN0t74+bOubxW0jB9zu1PLTh257yJlBBKU5E0QX0mYfdn8d6gq2xZGcwH5qKWtj3GxxuN1ekg9ro1gV7fVyb+0a6le0HtYTWb3KX/BZMEGIps=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6532bf6-0fb0-480b-d3e6-08ddf16b7fc8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 19:43:36.6163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGc5YOJA1gOiZh/5RwMIsWThjR6JGM3noyAZg3eEylm1cC2S987zNLW47JOUzmUiJT8BdD7g5JGQD2f/9qB9Hkvvnk9/j5dVVTG3v8bogFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7486
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509110177
X-Proofpoint-ORIG-GUID: IovsQ1bPeIZSlS_gCV0jT6yHT-FACbDh
X-Authority-Analysis: v=2.4 cv=PLMP+eqC c=1 sm=1 tr=0 ts=68c3266d b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=Oh2cFVv5AAAA:8 a=yPCof4ZbAAAA:8
 a=Uu9Kf0UarLNmtjgWBfsA:9 a=CjuIK1q_8ugA:10 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-GUID: IovsQ1bPeIZSlS_gCV0jT6yHT-FACbDh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE2MiBTYWx0ZWRfX5YbbuDbmFrTO
 3k9JQQZNYXdStfKZWzRXZP24OSrMSKyfdoEAbVuqAOlsS5VT2dr5Tzt6W3zKuLFrPNkqZsfumPY
 4q71Zk2WuXkE4uSiBR03aihJW599G1Om+sTNm5jpc6AAtlH5vGx795+F31x0YvtMWbL2Nhdy8E5
 lWZYgZ4wy9T1hEMbDeoTW73vM/3Vmv+xOL9wt7qCkp7ypGLrEkcDCKAdlHsI+4DABNpSlQrEpI9
 1JOhS6YQ2i3uxMjYkMxIredtWF+IqHjz4vckMuHLX5s5va/tph3NY8mBBVPAJHjXf0E6O7ExZAy
 D6MuRqQ5YdbX8/faHJjVb9YrGGu+mzNSUvnhU45sR+P6hlmCusft6w9xpx7/uqwjIZLNAphKSrX
 5FAvgAss

On Thu, Sep 11, 2025 at 02:11:39PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In dt_tp_event_info(), we parse tracepoint format files -- e.g.,
> /sys/kernel/debug/tracing/events/*/*/format.  Specifically, we
> are interested in the argument descriptions found in the file,
> but we are interested in skipping over "common fields."
> 
> The mechanism we used for this purpose was, in dt_provider_tp.c,
> to hardwire the number of fields to skip to SKIP_FIELDS_COUNT=4,
> assuming the common fields would always be type, flags, pid, and
> preempt_count.
> 
> This is hardly a robust mechanism.  For example, consider
>     https://kernel.googlesource.com/pub/scm/linux/kernel/git/rt/
>         linux-rt-devel/+/refs/tags/v5.9.1-rt20-patches/patches/
>         preempt-lazy-support.patch
> which introduces a preempt_lazy_count common field (on top of
> others).  Recent dtrace testing on RHCK 5.14 indicates widespread
> test failures due to this problem.
> 
> Implement a more robust mechanism.
> 
> Specifically, instead of skipping a hardwired (SKIP_FIELDS_COUNT=4)
> number of common fields, look for "common_" names.  E.g., in
> kernel/trace/trace_events.c in trace_define_common_fields(), we
> see the macro __common_field() is used to define common fields,
> and the names are prepended with "common_".

Comment below....

> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_provider_tp.c | 25 ++++++++-----------------
>  1 file changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
> index 4531a88a8..d0e980234 100644
> --- a/libdtrace/dt_provider_tp.c
> +++ b/libdtrace/dt_provider_tp.c
> @@ -17,13 +17,6 @@
>  #include "dt_probe.h"
>  #include "dt_impl.h"
>  
> -/*
> - * All tracing events (tracepoints) include a number of fields that we need to
> - * skip in the tracepoint format description.  These fields are: common_type,
> - * common_flags, common_preempt_coint, and common_pid.
> - */
> -#define SKIP_FIELDS_COUNT	4
> -
>  /*
>   * Tracepoint-specific probe data.  This is allocated for every tracepoint
>   * based probe.  Since 0 is not a valid tracepoint event id, and given that BTF
> @@ -129,10 +122,10 @@ dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp, const char *name,
>   * the identifier isn't as easy because it may be suffixed by one or more
>   * array dimension specifiers (and those are part of the type).
>   *
> - * All events include a number of fields that we are not interested in and that
> - * need to be skipped (SKIP_FIELDS_COUNT).  Callers of this function can
> - * specify an additional number of fields to skip (using the 'skip' parameter)
> - * before we get to the actual arguments.
> + * All events include a number of common fields that we are not interested
> + * in and that need to be skipped.  Callers of this function can specify an
> + * additional number of fields to skip (using the 'skip' parameter) before
> + * we get to the actual arguments.
>   */
>  int
>  dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
> @@ -146,11 +139,6 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>  
>  	tpp->id = 0;
>  
> -	/*
> -	 * Let skip be the total number of fields to skip.
> -	 */
> -	skip += SKIP_FIELDS_COUNT;
> -
>  	/*
>  	 * Pass 1:
>  	 * Determine the event id and the number of arguments (along with the
> @@ -162,9 +150,10 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>  
>  		if (sscanf(buf, "ID: %u\n", &tpp->id) == 1)
>  			continue;
> -
>  		if (sscanf(buf, " field:%[^;]", p) <= 0)
>  			continue;
> +		if (strstr(buf, " common_"))
> +			continue;

This would also skip any field that might have a type name like struct common_*
which is certainly not what we want to do.  You need to make sure that you match
on the field name only.  (And same below.)

You might be able to simplify by assuming (a safe bet) that all common_* fields
are at the beginning, and have the first loop count the number of common fields
to skip, i.e. increase skip for any common_* field found, and then the 2nd loop
can simply use that skip counter without needing to parse anything we are not
interested in.

>  		sscanf(p, "__data_loc %[^;]", p);
>  
>  		/* We found a field: description - see if we should skip it. */
> @@ -216,6 +205,8 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>  		p = buf;
>  		if (sscanf(buf, " field:%[^;]", p) <= 0)
>  			continue;
> +		if (strstr(buf, " common_"))
> +			continue;
>  		sscanf(p, "__data_loc %[^;]", p);
>  
>  		/* We found a field: description - see if we should skip it. */
> -- 
> 2.47.3
> 
