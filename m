Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C43313552
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761320680; cv=fail; b=ioNHpr+xYZzK6rbD71QIlPaTeYKWJlgFeVui4n0T7ZLyVqdCUcHcMGj96A5HaFRHPefsTGnU7w7mfpu95laHtN17G2mWgonDLy+dljXz4FMy0royeRCkOOvOk735oJAt6KOHDY3o5PJBCdRr5/FkITQE2esVuC5pVzAObjFgTlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761320680; c=relaxed/simple;
	bh=1J7vmwbHtsDA21cjQw+czWYasO+cw9103w25nGpcU3s=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K3bbayw8njAE3HqEz/KbQT2cEw0UU6MhYFSJkpqJzk4H70v2WsySA6gxJm3jHtcV5lUJxusEQ0HQ0KSIKmzUMMJ1vIEsorum3vO2liq1+iPn4LDYTpzkf3LFhzdVBZS2nXRnbG/6FpPSFyi/vl8N8svqSQV2dNSlJkwa/4uRfwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nW9Dddtb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Nsnom3po; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nW9Dddtb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Nsnom3po"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OEgAd5018568
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 15:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=iLrNnIpvQcc88H/NvYkhrFgCifGNGXw1smkbH1dn+3E=; b=
	nW9DddtbZ6vJHYlY+4k2sz40gXkI3QEHuMCMmJtQOO1OYDmNwISuwdjGGRImRWWw
	TzsyCD3uK38FnQhEv9beKFhJEOrocBOAsTUEleaQYCwfxBTHEceI4jHTOqmPedo9
	XNULx09NPEScLUINpPhQnMVppzXIhFgKld8C1mwFGB9dFbTdWifpEQjG+aoEOl+Z
	jNXiBmB3j/hWYv/24Gg1cZdGge4XYkYQ8Rtx/0uJ5dUvoLAgCPCJSLixihZLM5po
	MQ8O4GfBWLHbSxZDV1Nzp+slk1bEPNYBi1ezASqHcZY6YfTE0d7ipExJAtjscguA
	6nh5iZaF1JmI0XH7uIYRRw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xv5wn388-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 15:44:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59OFWUIf004442
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 15:44:36 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012040.outbound.protection.outlook.com [40.93.195.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bg25vp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 15:44:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGkBxCiqX7incjziUZAW0QEg5RdqDFfBcoLEjbIJVtYZ5Jt3r8JHC4NZ+Z684vnWLhzxh23Z409uGI77csJJAi/TLFrW8mmZbwaSaKoJihi7GEdSnxWCFrn23V2hR1//4rGjFlpiaPgjzHjEQYIuUWhOFxtkjvj83kzZFzJmr0jjmVZfMau06qCvBtk0OzpyTald5Cm+ylIJtG4yDmqsUBilfRIrulNiqI/VKJgpAjNxfswh7Ug95eEfs2S8aM3F2Kwo5FkxL0K9CtDb3Meedys9bkmuJK+5702Ct5nn62qtYZa/9768aMRAe5NR+4KOhBFIk2T0IR95kxFRIhhFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLrNnIpvQcc88H/NvYkhrFgCifGNGXw1smkbH1dn+3E=;
 b=V49naxnPhOC+5XWIjnMv2p1XINsZFB5IFjxa8YXKV+CppTOA5Ufhj7ce3KMFNXueIRDECXcxXI6h5RUzG97adJgJkoMh1XMosOFoQieHEq/kQR0OidL6bg8BqIkcjV2rZ8+KuAPLDvmkQW/75jXEoakz10iUaYxBk7XQnr8x+MK6ryQpUO4C2lTN7KIk6RefvFJADuQ+sg6N6NV9RyINXOKCrmn6YlASNfo4c6IeJvMPk3Gpp+pqrgkymW32zWu6mJkfA7MduHALsrn45t0u/KV/L6YX1ySJ4js+jw+EKI7kKd4D6gNWR13d3bHOL9dnk4//6slXVhpfCMLpzapqOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLrNnIpvQcc88H/NvYkhrFgCifGNGXw1smkbH1dn+3E=;
 b=Nsnom3poX83W9kFXBFDqNVkMLAQ3jY3Og/U9mrfwDTpJHVDAgPbvhskDsXUCV7zgMAquCRE5/I9J5mJWVVjRIiAAw8fwfjHBA3aU6xm+sI+WSZUfHdxKl4NV6s8nLKOm5WfCkxtbSkmpd4g4iwpmFXKgGQkXV5blwJMAGaOcAtk=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by DS0PR10MB8080.namprd10.prod.outlook.com (2603:10b6:8:1f7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Fri, 24 Oct
 2025 15:44:33 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:44:33 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>,
        "dtrace@lists.linux.dev"
	<dtrace@lists.linux.dev>,
        "dtrace-devel@oss.oracle.com"
	<dtrace-devel@oss.oracle.com>
Subject: Re: [PATCH v3 20/20] doc: Add rawfbt provider documentation
Thread-Topic: [PATCH v3 20/20] doc: Add rawfbt provider documentation
Thread-Index: AQHcRPulimihH8bebUqzxo7YizQnL7TRcB8M
Date: Fri, 24 Oct 2025 15:44:33 +0000
Message-ID:
 <BY5PR10MB3987B28DC1AE9E72BAA76CEBC2F1A@BY5PR10MB3987.namprd10.prod.outlook.com>
References: <20251024153338.15592-1-eugene.loh@oracle.com>
In-Reply-To: <20251024153338.15592-1-eugene.loh@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a4de43ec-192a-49eb-8e54-baeb8c71bbbe_Enabled=True;MSIP_Label_a4de43ec-192a-49eb-8e54-baeb8c71bbbe_SiteId=4e2c6054-71cb-48f1-bd6c-3a9705aca71b;MSIP_Label_a4de43ec-192a-49eb-8e54-baeb8c71bbbe_SetDate=2025-10-24T15:44:33.060Z;MSIP_Label_a4de43ec-192a-49eb-8e54-baeb8c71bbbe_Name=Confidential
 - Oracle
 Internal;MSIP_Label_a4de43ec-192a-49eb-8e54-baeb8c71bbbe_ContentBits=1;MSIP_Label_a4de43ec-192a-49eb-8e54-baeb8c71bbbe_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR10MB3987:EE_|DS0PR10MB8080:EE_
x-ms-office365-filtering-correlation-id: a7201c89-76fc-4ffa-3db8-08de13143a8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?goB0OzoQci6XVILo/hhlSPCUTAqwUlJUvcWo1k087UUHk/Aqjgz/dDjeBn+U?=
 =?us-ascii?Q?ddKl4KYYMIcSGUl6wNqdZzlsqp7V2dQ+V88Es1DCrSbMPASKvW8F+mqs+15k?=
 =?us-ascii?Q?186bjC728PjPcTUq/u7mOlgR6qP0DKwroMrcx1tMZfOAN8YQNDKCH2SY8C0e?=
 =?us-ascii?Q?nGSVlXhpsC6UG0uvqncKuLWKpMsIKMsAx7WA98LRePjGzW1G/pBES8d2SJ8D?=
 =?us-ascii?Q?G7HyWZAbyOC0szgSQDoGipBfgX/75hNImgz61lXLxgaa9mYtST8WSjKqKENc?=
 =?us-ascii?Q?XjjZF+LmnnWEl80T65l/Vdxw/uumpkcYTk85E3fiP+EAiMVuMZHJMA7W+csJ?=
 =?us-ascii?Q?VVzPRHAc3KcgWzWwIKspHaaPb6oKtX1eQFzsnN41oe9ZMi1RBkWDB+zsI7yh?=
 =?us-ascii?Q?Agv4/1R9Unnr01g3lNpJ3xSqVbsOELhuOgItQPYKqBIK17yL8AQqVEV6S1tJ?=
 =?us-ascii?Q?7XZsAMK6Gm7oj+A5EINNB3yl8W3qQ4ZyjDLH/mi79+mnSNdaOs+cuvCY2PAg?=
 =?us-ascii?Q?mEtZdg2h7zkV523BILfrFOBxIVLKw8IRrDK7vpjnnC+GWBzP/PTn98EH+GXD?=
 =?us-ascii?Q?Cp+PCVHF3JhuyOBW1dFCPqmWNClhASEdqkqYiuyTj1h10ecdnuqtmp7cI3p4?=
 =?us-ascii?Q?5jksMxW7DxWpK+6fd0tUcOT8+n07wq/ok6MRdmMqx6D+oReMC4aFBtP+VEzW?=
 =?us-ascii?Q?AKPZq80dX7s6j5uoxedzQY6aTwGeaZM38G4PcI58TtwcBjysU6eSsa1TcI8+?=
 =?us-ascii?Q?RCAh+CRUX6Chh1/AQXxMYLpKZEcbcZBDFrv+bbFUyEoRqcry+obeWz8yhqiU?=
 =?us-ascii?Q?erWXf6kaA6NfyubPAH0Dvs7nOyPxzh8qbuWwX9BmN2GWW9yqlTyokrCLkd4l?=
 =?us-ascii?Q?c/qYRZgpdvVXCG6pHFJEHIhNnBvhj33+Mc9BcAURLXfFcuYe/XlCA+M5rTPN?=
 =?us-ascii?Q?SkJ5JJ+znLcOfvoFzb/WxeW7SrG7gP7wWxFkMDrD/EvTX9XHbiSlYUArrOgs?=
 =?us-ascii?Q?08tdZMLC4/lA05Ww2qZ2uw7JI89aXP15g2TgVQHF0WBUtlY3s5pq3TCcWMYi?=
 =?us-ascii?Q?9UQ2/2f1Z3HkCERizLPGzym9MD8Nz5YDBTfCppQqv5W6GpbFMKeDkMDZ59kh?=
 =?us-ascii?Q?f+2MTDdLKDN9q6KZCB94/hOe6b7k+3iksIG0M++7j5QjqxZ5TYHCuYAEdt8+?=
 =?us-ascii?Q?ao+4h0cKOldOc5UOdBiMStuj/H/HD/uXooipNDM7IA4HNjhh2SWoKJv9vovw?=
 =?us-ascii?Q?+1eJimBUaurk/tptL/X+X963cl9IgpvqjVsLwzCDFBZJWYiAnHODTOHeVixZ?=
 =?us-ascii?Q?uis4I868QxxSHPpmGuExAbRkN8lwo7InWoXu42OzVPrydaYIiuG+wcGzdKNH?=
 =?us-ascii?Q?F16Zdy3J9IHnMCGp8zZsUe4ecu/9zJJp5pbTPZJlbynQDVQWKLZ3uLBj2509?=
 =?us-ascii?Q?SI1kkk2XuHTmaiAT2xAx9qWk+AxerP7XeW18ZJSgU3VXtjrdQuIObVm9yl4k?=
 =?us-ascii?Q?YfID40YULQ3atBbh6UTAxNg5TG3DG4Im+8xl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JIDhXzQg44Vb0TKK7MCC4SeaxvxxVCiuj7aQqRfV3et372UtZ07gqwAA1e5I?=
 =?us-ascii?Q?EVIE9F5/M/JswhFuMYmCbLZ0DnizRFw+3yImL3zqrK5mopERlneh3MbXNP8K?=
 =?us-ascii?Q?g74dEoJ8I8Y7VbSimspenNKf98dlwfHUlWw7ZlUrqg4jMa92K+BJGJ7ah3CQ?=
 =?us-ascii?Q?xnZ0dzsVuNveQcjJ4er3VbqRAaeuX65hExHu42T0gFbUVk1vDqVarJ48F0Qt?=
 =?us-ascii?Q?dWOAgKL9Don2wcFqbYjFe3bcsgvgfRlMtj+0oErQ1L4ILGJeujobAsp3H7N7?=
 =?us-ascii?Q?eemRmAzPvZFlmTo/r8gysKSimDcbzsvJ0DjTKH/TAjO6pPvtinXAd5svYVKW?=
 =?us-ascii?Q?ynKqD8ksHpizevaI83yNzpFrY8TmlrQ82TAUaChNt+ua97QG6i+KS4p3pEGQ?=
 =?us-ascii?Q?FYMY7vPzh0+YZVBE1LQvMpsCvpeqx8evJ50beBLn7/T2r0LcUL5li0vnGEMc?=
 =?us-ascii?Q?KlEe4FtaAXnmpxgL3H2GKsTbV+OnG7Petyc0F80iKp4LVCS0K+5l3wA+u19O?=
 =?us-ascii?Q?m7Oma+NaNx8L1/HXl9K+TPHWOBB2Hu/rVKvdtcNY9yzkbBOIsTh/NwNZaTRn?=
 =?us-ascii?Q?a7s0v2+iym45nidXRtvTQWI3JqB8PJ0/Atz2qgl4RYBrZkv8p3tKko9jyQAT?=
 =?us-ascii?Q?cfZOIzGw7XVDJX3zru2EVJbXErJdzJBq1lsn1+sfNOJqF1cAqiBqLoGKaG81?=
 =?us-ascii?Q?ygbi31q39i8eyP9R5/Kt/SiG5/9mssD6YPmP2OVCGuO7rL/Ht/DguWZf68Tm?=
 =?us-ascii?Q?ka+kJ7Hmts913FyTF+lSyuoXeFRKno5FPNwD+jCEE0ENznPwvCj/64hm6S51?=
 =?us-ascii?Q?oeAm0aAOV5Su/CgoUOAzZb44juXVsCJQXiS/4rIkTPyQqgiFZu7kyQTuVSuJ?=
 =?us-ascii?Q?vUbeTUlVJrK5ptiEm0VsWWWnySAnq+9jxUyAawm7gxmJdu3GjN23q1Tmh7i/?=
 =?us-ascii?Q?GVgcL98FI4Rc16TwOVVb29vy9vi6jHZCl4keOEPRDdL8NOaVwF5eCUt3dM5w?=
 =?us-ascii?Q?jLWJKB+EDFajIPPBagQjh7+FXFEMcG4ADvXRzAXSz+NqcmjAOC9kAXtWP/TA?=
 =?us-ascii?Q?6Yr9ZlZIdafO/IRGAnJ6jrNe+3Rdn5A/ROAe4FQOIQwniO48Xdgn/wq16mz+?=
 =?us-ascii?Q?1cEMwfkPbseeK9gkjXLWPz6iDZtOtYENoMSkn3Tn0glNNIrgzxz46NDn8BRd?=
 =?us-ascii?Q?MIfpZr9HZorhY2Ly8yRQW30QxVLnygtJdErfxptkVKngAqY3sNGLxKVVqZ5s?=
 =?us-ascii?Q?p+XKn8L9ly/0XsUjoRkTQYzihLgK6cKUIkxIZkbnFW55UJkL/muho3tJ3kRZ?=
 =?us-ascii?Q?6+KAeTe4ASitKJ13K/5dedkHSmToNkEhb5f2TVqe28IObxgmF2ewCkdam1aN?=
 =?us-ascii?Q?MqzBQtQLKPAEIumvVfCQENKDg44G2yfqeUWWIvt1zDj0jz8six6UDo/NNqaO?=
 =?us-ascii?Q?R6ug+rDw0BhbCg02KH9WkYjS7kNMOYZ/xXWsut+TEXXNAqc3uv4ESexmC+x/?=
 =?us-ascii?Q?r4HGOLchJ8UDbIj82xiSZQ6wu92HT7IfsPZuXDtFVtWkPZtLpBW3LhYVkIlf?=
 =?us-ascii?Q?Tg1xuaDJBzotT3lee3W9qbz+M9oOQ18NSYMpZ7F/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zX+VqQTva+46+rZ3LyQeotY7G9AcDBaS1jRIpL6yei508TXlLymhmU5CJ7uPIWC6aIklqadFK7346KeYesY+eVRNDYM7cah/gBm5qS4EwWHKkmoev46WsTKb2v4jJnw+6HuVeKEs50TRCLiKacgBxFmsHZcFJWqqiZYSXUKlONdziFFt3ytDLixPhOFEF9hBzuUYqErLO5IoWi20W152ro3KC5VwhiD82uJi7E217wfcI6zs6LVrURrlL0iGoJQkHYUzQq/YYlA9E/GF9SFJnftLNRKDA53yGVxoP6cVWv/4ugXKpswe+JunNW32IAB/sah5Dg4r2p/RedmhWAVqSY+n33J0f9O0DnXWm/yXlVC5dIPaIRx4ez9J68nqb7L6QS1AApvGmQJoUn1/9rCsoWqGbljcC/TqjghJx4NntFyE5R7HNR9BWL7XAK4wrsaujmQpLLTQ6yR81VXuaSQClPhtzr0idXpQ/dpYns2dI8plJ/U9jqz+kzSEZFeqKDTZUWTj/+JgEtfZaWKixFUqaoXH3pd6rrYemUZR/lMtGwEUsA79/7p7jZcRviPxlUzyMCDHnhS/CmGtUkGnPEK50WR4v6X/q7xmIBzn0QUUs6U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7201c89-76fc-4ffa-3db8-08de13143a8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 15:44:33.5184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nDvmEBJcHs1sH3jSEAhRI4vAzpZMFzUTecqzofuq6KFOWEGNNoDjWCVANABFxFIu2WjTQhsZDPQpibZSvu1TACARpSM/bZdk3NwbpfHzAhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8080
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510240141
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MSBTYWx0ZWRfX2s42dozxbE+Q
 ERsoxru50OcQJNlzSp2hUHmbHcSgGri+erTzcQkreL8UoYx+3gLVblDtGfy7y6k6hK2EUNDDzSy
 6a2JFHSb+57NBpugl3r5n6sSRj3QkeAx9/fds2NvC+9TFj/eElrs5j+SIgFcbo807x6axkvudmD
 fAiwOCkKXc/5m9AdwGmzIZPvUVs7ghMe2H8PMjc0eGs5ZUHVghhoJcv3CWNkwRBTvO8ra+hyzOS
 8i9VBdQx43p+c/tOPFoorkE1T55zp/bYinf72N3QlKLvvEMhz58cp2ZkL20PCqmBSUOiqmNlefm
 YPUD+HSIOg09CQAUyNVNAUl3UyTSLFZoIQ39nYwd2ZaH6z4gbbf+MVdWHLJjUIEf/PAfAfLpoQJ
 z8ChAi0OAP6lboTstkdrv0GJ59zoVg==
X-Proofpoint-GUID: iLunTFjtbNCu4OX2yrwYDFEma3tMq8Bt
X-Proofpoint-ORIG-GUID: iLunTFjtbNCu4OX2yrwYDFEma3tMq8Bt
X-Authority-Analysis: v=2.4 cv=RfOdyltv c=1 sm=1 tr=0 ts=68fb9ee5 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8 a=v5vgSPytC6PihjlyA-wA:9
 a=CjuIK1q_8ugA:10

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>


________________________________________
From: eugene.loh@oracle.com <eugene.loh@oracle.com>
Sent: Friday, October 24, 2025 11:33 AM
To: dtrace@lists.linux.dev; dtrace-devel@oss.oracle.com
Subject: [PATCH v3 20/20] doc: Add rawfbt provider documentation

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                        |  4 ++
 doc/userguide/reference/dtrace_providers.md   |  2 +
 .../reference/dtrace_providers_rawfbt.md      | 50 +++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 doc/userguide/reference/dtrace_providers_rawfbt.md

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index f86c8b9e5..da9a08687 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -241,6 +241,10 @@
         -   [profile Probe Arguments](reference/dtrace_providers_profile.m=
d#dt_ref_profargs_prov)
         -   [profile Probe Creation](reference/dtrace_providers_profile.md=
#dt_ref_profprobecreate_prov)
         -   [profile Stability](reference/dtrace_providers_profile.md#dt_r=
ef_profstab_prov)
+    -   [Raw FBT Provider](reference/dtrace_providers_rawfbt.md)
+        -   [rawfbt Probes](reference/dtrace_providers_rawfbt.md#dt_ref_ra=
wfbtprobes_prov)
+        -   [rawfbt Probe Arguments](reference/dtrace_providers_rawfbt.md#=
dt_ref_rawfbtargs_prov)
+        -   [rawfbt Stability](reference/dtrace_providers_rawfbt.md#dt_ref=
_rawfbtstab_prov)
     -   [Rawtp Provider](reference/dtrace_providers_rawtp.md#dt_ref_rawtp_=
prov)
         -   [rawtp Stability](reference/dtrace_providers_rawtp.md#dt_ref_r=
awtpstab_prov)
     -   [Sched Provider](reference/dtrace_providers_sched.md#dt_ref_sched_=
prov)
diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/re=
ference/dtrace_providers.md
index f11bacb2f..45623d92f 100644
--- a/doc/userguide/reference/dtrace_providers.md
+++ b/doc/userguide/reference/dtrace_providers.md
@@ -21,6 +21,8 @@ The `pid` provider traces a user process, both function `=
entry` and `return`, an
 The `proc` provider makes available the probes that pertain to the followi=
ng activities: process creation and termination, LWP creation and terminati=
on, execution of new program images, and signal sending and handling.
 -   **[Profile Provider](../reference/dtrace_providers_profile.md)**
 The `profile` provider includes probes that are associated with an interru=
pt that fires at some regular, specified time interval.
+-   **[Raw FBT Provider](../reference/dtrace_providers_rawfbt.md)**
+The `rawfbt` provider is a version of the `fbt` provider based on kprobes,=
 allowing probing of synthetic function variants generated by the compiler.
 -   **[Rawtp Provider](../reference/dtrace_providers_rawtp.md)**
 The `rawtp` provider gives DTrace users access to the raw tracepoints expo=
sed by the kernel tracing system, including access to the untranslated argu=
ments of the associated tracepoint events.
 -   **[Sched Provider](../reference/dtrace_providers_sched.md)**
diff --git a/doc/userguide/reference/dtrace_providers_rawfbt.md b/doc/userg=
uide/reference/dtrace_providers_rawfbt.md
new file mode 100644
index 000000000..7b1fc7723
--- /dev/null
+++ b/doc/userguide/reference/dtrace_providers_rawfbt.md
@@ -0,0 +1,50 @@
+# Raw FBT Provider
+
+The [fbt provider](../reference/dtrace_providers_fbt.md) consists of
+probes that are associated with the entry to and return from most function=
s
+in the Linux kernel.  It does not support tracing synthetic functions,
+that is, compiler-generated functions with a . in their name.
+
+In contrast, the `rawfbt` provider implements a variant of the FBT provide=
r
+and always uses kprobes.  It does allow tracing of synthetic functions, su=
ch
+as compiler-generated optimized variants of functions with . suffixes.
+
+You can see the raw FBT probes on your system with:
+
+```
+sudo dtrace -lP rawfbt
+```
+
+As with the `fbt` provider, there could be tens of thousands of probes,
+and effective use requires knowledge of the kernel implementation.
+
+**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers=
.md)
+
+## rawfbt Probes <a id=3D"dt_ref_rawfbtprobes_prov">
+
+The module name of a `rawfbt` probe is `vmlinux` for built-in modules.
+The function name is the probed function.
+The probe name is either `entry` or `return`.
+
+## rawfbt Probe Arguments <a id=3D"dt_ref_rawfbtargs_prov">
+
+The arguments to `entry` probes are the same as the arguments to the corre=
sponding operating system kernel function.
+These arguments can be accessed as `int64_t` values by using the `arg0`, `=
arg1`, `arg2`, ... variables.
+
+If the function has a return value, the return value is stored in `arg1` o=
f the `return` probe.
+If a function doesn't have a return value, `arg1` isn't defined.
+
+There are no typed `args[]` arguments for any `rawfbt` probes.
+
+## rawfbt Stability <a id=3D"dt_ref_rawfbtstab_prov">
+
+The `rawfbt` provider uses DTrace's stability mechanism to describe its st=
abilities.
+These stability values are listed in the following table.
+
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | Common           |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | ISA              |
+| Name      | Evolving       | Evolving       | Common           |
+| Arguments | Private        | Private        | ISA              |
--
2.47.3


